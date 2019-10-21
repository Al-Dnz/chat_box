class SessionsController < ApplicationController
  before_action :check_session, only: [:new, :create]

  # def initialize
     @@accumulator = 0
  # end

  def index

  end

  def new
    #Session.delete if session['token']
  end

  def create

    username = params[:username]
    @session = Session.new
    if Session.exists?(username: username)
      lastest_indicator = Session.where(username: username).count + 1
      username = "#{username}##{lastest_indicator}"
    end
    @session.username = username

    random_token = SecureRandom.hex(10)
    until Session.find_by(token: random_token).nil?
      random_token = SecureRandom.hex(10)
    end
    @session.token = random_token


    if @session.save
      session[:token] = @session.token
      User.create(nickname: @session.username, token: @session.token)
      flash[:notice] = "You signed up successfully"
      flash[:color]= "valid"
      redirect_to posts_path
    else
      flash[:notice] = "Form is invalid"
      flash[:color]= "invalid"
      redirect_to new_session_path
    end

  end

  def delete
    current_session_token = session[:token]
    session = Session.find_by(token: current_session_token)
    current_session_name = session.username
    Session.delete(session.id) if session
    reset_session #if session[:token]
    ActionCable.server.broadcast 'presence_list', {presence: false, username: current_session_name, token: current_session_token }
    #ActionCable.server.remote_connections.where(current_user: current_session_name).disconnect
    redirect_to new_session_path
  end

  private

  def check_session
    redirect_to posts_path if session[:token] != nil
  end

  def check_uniqueness(username)
    Session.find_by(username: username).nil?
  end

end

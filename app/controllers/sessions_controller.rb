class SessionsController < ApplicationController
  before_action :check_session, only: [:new, :create]

  # def initialize
     @@accumulator = 0
  # end

  def index
  end

  def new
    puts "$$$$$$-----|| HELOO FROM HOME PAGE ||----$$$$$$$$"
    puts "$$$$$$-----|| Accumulatore==> #{@@accumulator} ||----$$$$$$$$"
    @@accumulator += 1
  end

  def create
    session[:username] = params[:session][:username]
    puts "******|| PARAMS_SESSION ==> #{session[:username]} ||*******"
    session = Session.create(username: params[:session][:username])
    redirect_to posts_path
  end

  def delete
    current_session_name = session['username']
    session = Session.find_by(username: current_session_name)
    Session.delete(session) if session
    reset_session #if session[:username]
    #ActionCable.server.broadcast 'presence_list', {presence: 0, username: current_session_name }
    redirect_to new_session_path
    # ActionCable.server.remote_connections.where(current_user: session[:username]).disconnect
  end

  private

  def check_session
    redirect_to posts_path if session[:username]
  end

end

class PostsController < ApplicationController
  before_action :check_session

  def index
    @posts = Post.all.order(created_at: :asc)
    @sessions = Session.all
    token = session['token']
    session = Session.find_by(token: token)
    ActionCable.server.broadcast 'presence_list', {presence: true, username: session.username, token: token }
  end

  def create
  end

  def destroy
    @post = Post.find(params[:id])
    Post.delete(@post)
    redirect_to root_path
  end

  # def destroy_all
  #   Post.all.each {|post| Post.delete(post)}
  #   redirect_to root_path
  # end

  private

  def check_session

    if session[:token].nil? || Session.find_by(token: session[:token]).nil?
      redirect_to new_session_path
    end

  end

end

class PostsController < ApplicationController
  before_action :check_session

  def index
    @posts = Post.all.order(created_at: :asc)
    @sessions = Session.all

    if session[:username].nil? || Session.find_by(username: session[:username]).nil?
      redirect_to new_session_path
    else
      ActionCable.server.broadcast 'presence_list', {presence: true, username: session[:username]}
    end

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
    redirect_to new_session_path if !session
  end

end

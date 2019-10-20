class PostsController < ApplicationController
  #before_action :check_session

  def index
    @posts = Post.all.order(created_at: :asc)
    gon.initial_number_post = @posts.count
    gon.watch.posts = @posts
    #gon.posts = @posts
    @username = ""
    @username = cookies[:user_name].to_s  if cookies[:user_name] != nil

  end

  def create
    params[:user] == "" ? name  = "Anonyme" : name = params[:user]
    if !params[:content].empty?
      @post =  Post.create(user: name.capitalize, content: params[:content])
      cookies[:user_name] = params[:user]
      respond_to do |format|
       format.js
      end
    end
    #redirect_to root_path
  end

  def destroy
    @post = Post.find(params[:id])
    Post.delete(@post)
    redirect_to root_path
  end

  def destroy_all
    Post.all.each {|post| Post.delete(post)}
    redirect_to root_path
  end

  private

  def check_session
    redirect_to new_session_path if session[:username] = nil
  end

end

class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :asc)
    gon.watch.posts = @posts
    @username = "votre nom"
    @username = cookies[:user_name].to_s  if cookies[:user_name] != nil

  end

  def create
    params[:user] == "" ? name  = "Anonyme" : name = params[:user]
    @post =  Post.create(user: name.capitalize, content: params[:content])
    cookies[:user_name] = params[:user]
    respond_to do |format|
     format.js 
    end
    #redirect_to root_path
  end

  def destroy
    @post = Post.find(params[:id])
    Post.delete(@post)
    redirect_to root_path
  end
end

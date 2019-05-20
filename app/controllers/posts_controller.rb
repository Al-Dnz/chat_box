class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :asc)
    gon.watch.posts = @posts
    
  end

  def create
    @post =  Post.create(user: params[:user].capitalize, content: params[:content])
    redirect_to root_path
  end

  def destroy
    @post = Post.find(params[:id])
    Post.delete(@post)
    redirect_to root_path
  end
end

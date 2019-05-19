class PostsController < ApplicationController
  def index
    @posts = Post.all
    gon.posts = @posts 
  end

  def create
    @post =  Post.create(user: params[:user], content: params[:content])
  end

  def destroy
    @post = Post.find(params[:id])
    Post.delete(@post)
  end
end

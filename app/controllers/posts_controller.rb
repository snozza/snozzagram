class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else @photo.delete
      flash[:notice] = 'There was a problem!'
      redirect_to new_post_path
    end
  end


  def post_params
    params.require(:post).permit(:image, :caption)
  end

end

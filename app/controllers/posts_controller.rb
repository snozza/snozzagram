class PostsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @user = User.find(current_user)
    @post = @user.posts.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end


  def post_params
    params.require(:post).permit(:image, :caption)
  end

end

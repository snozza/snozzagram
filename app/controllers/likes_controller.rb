class LikesController < ApplicationController

  def create

    @post = Post.find(params[:post_id])
    @post.likes.create
    puts @post.likes.count
    render json: { new_like_count: @post.likes.count }

  end
end

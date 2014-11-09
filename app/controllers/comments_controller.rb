class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    puts params
    @comment = @post.comments.new(params.permit(:body))
    if @comment.save
      render json: {new_comment: "<li>#{@comment.body}</li>"}
    else
      render 'new'
    end
  end

end

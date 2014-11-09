class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(params.permit(:body))
    @comment.user_id = current_user.id
    if @comment.save
      render json: {new_comment: "<li>#{@comment.body}</li>"}
    else
      render 'new'
    end
  end

end

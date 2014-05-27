class CommentsController < ApplicationController
  load_and_authorize_resource

  def create
    @comment = @post.comments.create(safe_params)
    redirect_to post_path(@post)
  end

  private

  def safe_params
    params.require(:comment).permit(:comment, :user_id)
  end
end

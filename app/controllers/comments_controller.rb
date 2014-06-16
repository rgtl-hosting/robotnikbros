class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(safe_params)
    redirect_to post_path(@post)
  end

  private

  def safe_params
    params.require(:comment).permit(*policy(@comment || Comment).safe_attributes)
  end
end

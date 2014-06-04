class CommentsController < ApplicationController
  before_filter :create
  load_and_authorize_resource

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(safe_params)
    redirect_to post_path(@post)
  end

  private

  def safe_params
    params.require(:comment).permit(:comment, :user_id)
  end
end

class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @posts = Post.ordered
  end

  def show
  end

  def destroy
    @post.destroy
    redirect_to root_url
    flash[:success] = "Successfully Deleted Post: #{@post.title}."
  end

  def new
  end

  def create

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @post.update(safe_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  private

  def safe_params
    params.require(:post).permit(:title, :body, :user_id, :bootsy_image_gallery_id)
  end

end

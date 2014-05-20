class PostsController < ApplicationController

  def index
    @posts = Post.ordered
  end

  def show
    @post = current_post
  end

  def destroy
    @post = current_post
    @post.destroy
    redirect_to root_url
    flash[:success] = "Successfully Deleted Post: #{@post.title}."
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(safe_params)

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
    @post = current_post
  end

  def update
    @post = current_post

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

  def current_post
    Post.find(params[:id])
  end

end

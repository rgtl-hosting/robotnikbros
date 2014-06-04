class PostsController < ApplicationController
  load_and_authorize_resource skip_load_resource only: [:create]

  def index
    @posts = Post.ordered
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
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

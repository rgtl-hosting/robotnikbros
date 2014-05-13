class PostsController < ApplicationController

  def index
    @posts = Post.ordered
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to post_comments_path(@post) }
      format.xml  { head :ok }
    end
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
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

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

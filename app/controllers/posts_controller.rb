class PostsController < ApplicationController

  def index
  end

  def show
  end

  def destroy
  end

  def new
  end

  private

  def safe_params
    [
      :title,
      :body,
      :user_id,
    ]

end

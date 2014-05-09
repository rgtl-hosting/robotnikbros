module PostsHelper

  def recent_posts
    Post.ordered.last(10)
  end

  def current_user_posts
    Post.where(:user_id => params[:id])
  end

end

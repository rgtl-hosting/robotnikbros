module PostsHelper

  def recent_posts
    Post.ordered.last(10)
  end

end

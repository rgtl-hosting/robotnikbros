class PostPolicy < ApplicationPolicy

  def safe_attributes
    [
      :title,
      :body,
      :user_id,
      :bootsy_image_gallery_id,
    ]
  end
end

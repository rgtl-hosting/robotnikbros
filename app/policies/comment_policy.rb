class CommentPolicy < ApplicationPolicy

  def safe_attributes
    [
      :comment,
      :user_id,
    ]
  end
end

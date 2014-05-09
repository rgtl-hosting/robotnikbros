class Post < ActiveRecord::Base

  validates :title, presence: true
  validates :body, presence: true
  belongs_to :user

  scope :ordered, order('created_at DESC')
end

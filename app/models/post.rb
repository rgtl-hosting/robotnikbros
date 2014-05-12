class Post < ActiveRecord::Base
  include Bootsy::Container

  validates :title, presence: true
  validates :body, presence: true
  belongs_to :user
  has_many :comments

  scope :ordered, order('created_at DESC')
end

class Post < ApplicationRecord
  has_attached_file :image
  # validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  belongs_to :user
  validates :title, presence: true
  validates :body, presence: true
end

class Blog < ApplicationRecord
	belongs_to :user

	validates :title,:user_id, :cover_photo, :body, presence: true

  mount_uploader :cover_photo, PictureUploader

	scope :sort_by_time, ->{order created_at: :desc}
  scope :get_by_author, ->(user_id){where user_id: user_id}
  scope :get_blog, ->(blog_id){where id: blog_id}
end

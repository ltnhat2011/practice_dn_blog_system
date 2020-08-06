class AddCoverPhotoToBlogs < ActiveRecord::Migration[6.0]
  def change
    add_column :blogs, :cover_photo, :string
  end
end

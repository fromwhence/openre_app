class ChangeImageInPhotos < ActiveRecord::Migration[6.0]
  def change
    rename_column :photos, :image_urls, :image_url
  end
end

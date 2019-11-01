class ChangePhotosUrlName < ActiveRecord::Migration[6.0]
  def change
    rename_column :photos, :url, :image_urls
  end
end

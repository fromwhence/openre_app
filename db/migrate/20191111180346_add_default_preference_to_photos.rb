class AddDefaultPreferenceToPhotos < ActiveRecord::Migration[6.0]
  def change
    add_column :photos, :default_preference, :boolean, default: false
  end
end

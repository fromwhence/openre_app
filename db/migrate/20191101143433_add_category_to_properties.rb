class AddCategoryToProperties < ActiveRecord::Migration[6.0]
  def change
    add_column :properties, :home_category, :integer
  end
end

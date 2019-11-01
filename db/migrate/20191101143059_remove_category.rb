class RemoveCategory < ActiveRecord::Migration[6.0]
  def change
    remove_column :properties, :home_category, :string
  end
end

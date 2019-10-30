class EditBathroomsInProperty < ActiveRecord::Migration[6.0]
  def change
    change_column :properties, :baths, :decimal, precision: 3, scale: 1
  end
end

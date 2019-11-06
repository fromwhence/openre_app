class AlterPriceInProperties < ActiveRecord::Migration[6.0]
  def change
    remove_column :properties, :price, :decimal
  end
end

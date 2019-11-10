class AddDateToOpenhouses < ActiveRecord::Migration[6.0]
  def change
  	add_column :open_houses, :date, :datetime
  end
end

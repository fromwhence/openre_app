class RemoveDateFromOpenhouses < ActiveRecord::Migration[6.0]
  def change
  	 remove_column :open_houses, :date, :datetime
  end
end

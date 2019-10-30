class CreateOpenHouses < ActiveRecord::Migration[6.0]
  def change
    create_table :open_houses do |t|
      t.integer :property_id
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end
end

class CreateInterests < ActiveRecord::Migration[6.0]
  def change
    create_table :interests do |t|
      t.integer :buyer_id
      t.integer :property_id
      t.integer :rating
      t.text :notes
      t.bit :active

      t.timestamps
    end
  end
end

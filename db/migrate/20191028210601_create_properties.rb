class CreateProperties < ActiveRecord::Migration[6.0]
  def change
    create_table :properties do |t|
      t.integer :realtor_id
      t.integer :mls_number
      t.string :home_category
      t.decimal :price
      t.string :address
      t.integer :bedrooms
      t.decimal :baths
      t.integer :square_footage
      t.integer :year_built
      t.text :description
      t.string :listing_url

      t.timestamps
    end
  end
end

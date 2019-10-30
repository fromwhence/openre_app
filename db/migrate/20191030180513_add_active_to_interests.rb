class AddActiveToInterests < ActiveRecord::Migration[6.0]
  def change
    add_column :interests, :active, :boolean
  end
end

class EditActiveInInterests < ActiveRecord::Migration[6.0]
  def change
    remove_column :interests, :active, :boolean, limit: 1
  end
end

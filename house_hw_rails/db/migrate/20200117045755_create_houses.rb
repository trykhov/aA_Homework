class CreateHouses < ActiveRecord::Migration[5.1]
  def change
    create_table :houses do |t|
      t.text :address
    end
    add_index :houses, :address, unique: true
  end
end

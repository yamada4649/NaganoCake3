class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :end_user_id
      t.string :ship_address
      t.string :ship_toname
      t.string :postal_code
      t.timestamps
    end
  end
end

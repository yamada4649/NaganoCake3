class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :end_user_id
      t.text :address
      t.integer :total_due
      t.integer :freight
      t.string :addressee
      t.integer :order_status, default: 0
      t.string :postal_code
      t.integer :payment_method, default: 0
      t.timestamps
    end
  end
end

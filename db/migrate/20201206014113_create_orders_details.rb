class CreateOrdersDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :orders_details do |t|
    t.integer "order_id"
    t.integer "item_id"
    t.integer "production_status"
    t.integer "amount"
    t.integer "price"
      t.timestamps
    end
  end
end

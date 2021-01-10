class OrdersDetail < ApplicationRecord
   belongs_to :order
   belongs_to :item

    enum production_status: {
 	block_phone: 0, wait_product: 1,producting: 2,complete_product: 3,}
end

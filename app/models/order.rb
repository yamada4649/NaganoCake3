class Order < ApplicationRecord
    belongs_to :end_user
    has_many :orders_details,dependent: :destroy

    enum payment_method:{ creditcard: 0, bank: 1, pay_pay: 2}#enumの場所をbelongs_toの上にすると,undefind_methodで治る。可能性あり。
    enum order_status:{wait_money: 0, confirm_money: 1,product: 2,ready_toship: 3,complete_ship: 4}

end

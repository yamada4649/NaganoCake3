class Public::OrdersController < ApplicationController
	def new
		@order = Order.new
		@address  =Address.new
	end
	def complete
	end
	def create
     if current_end_user.cart_items.exists?
        @order = Order.new(order_params)
        @order.end_user_id = current_end_user.id
        @order.order_status = 0
        @order.save
         #cart_itemsの内容をorder_detailsに新規投稿
        current_end_user.cart_items.each do |cart_item|
        order_item = @order.orders_details.build #order_itemの箱を作っているイメージ
        order_item.order_id = @order.id
        order_item.item_id = cart_item.item_id
        order_item.amount = cart_item.amount
        order_item.price = cart_item.item.notax_price
        order_item.production_status = 0
        order_item.save
        cart_item.destroy
     end
        redirect_to  orders_complete_path
     else
     	flash[:danger] = 'カートが空です。商品を選択して下さい。'
        redirect_to items_path
     end
	end
	def confirm
		@order = Order.new(order_params)
        @cart_items = CartItem.all
        @order.payment_method = params[:order][:payment_method]
        @order.freight = 800
    if  params[:order][:address_option] == "0"
           @order.postal_code = current_end_user.postal_code
           @order.address = current_end_user.address
           @order.addressee = current_end_user.first_name + current_end_user.last_name
     elsif params[:order][:address_option] == "1"
           @sta = params[:order][:addresss_id].to_i
           @send_to_address = Address.find(@sta)
           @order.postal_code = @send_to_address.postal_code
           @order.address = @send_to_address.ship_address
           @order.addressee = @send_to_address.ship_toname


     elsif params[:order][:address_option] == "2"
          @address = Address.new(end_user_id: current_end_user.id)
          @address.postal_code = @order.postal_code
          @address.ship_address =@order.postal_code
          @address.ship_toname = @order.addressee
        if @address.save
        	@order.postal_code =  @address.postal_code
            @order.address =  @address.ship_address
            @order.addressee = @address.ship_toname
        else
        	render 'new'
        end
        orderのconfirmページからcreateアクションでデータをhidden_fieldで送りたいが送れない。
strong parameterでparams is missingとなっていること。
	end
    end
  private
    def order_params
  	params.require(:order).permit(:end_user_id,:payment_method,:address,:total_due,:freight,:addressee,:order_status,:postal_code)
    end
end

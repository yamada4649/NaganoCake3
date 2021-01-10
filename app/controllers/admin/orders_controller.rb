class Admin::OrdersController < ApplicationController

 def index
  	@orders = Order.all
 end
 def show
 	@order = Order.find(params[:id])
    @order_item = @order.orders_details
 	
 end
 def update
    @order = Order.find(params[:id])
    @orders_detail = @order.orders_details
    @order.update(order_params)
   if @order.order_status == "product"
     @orders_detail.update_all(production_status: 2)#制作ステータスを制作待ちに　更新
   else
     @order.order_status == "confirm_money"
     @orders_detail.update_all(production_status: 1)
   end
    flash[:notice] = "更新に成功しました"

    redirect_to admin_order_path(@order)
    
  end


 private
  def order_params
  	params.require(:order).permit(:end_user_id,:payment_method,:address,:total_due,:freight,:addressee,:order_status,:postal_code)
  end
end

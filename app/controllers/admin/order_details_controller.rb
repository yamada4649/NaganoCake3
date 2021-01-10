class Admin::OrderDetailsController < ApplicationController
	def update
 	 @orders_detail = OrdersDetail.find(params[:id])
 	 @order = @orders_detail.order
     @orders_detail.update(orders_details_params)
    flash[:succsess] = "更新に成功しました"
    if @orders_detail.production_status == "wait_product"
    	@order.update(order_status: 1)
    elsif @order.orders_details.count == @order.orders_details.where(production_status: "complete_product").count
    	 @order.update(order_status: 3)#注文ステータスを発送準備中に更新

    elsif @orders_detail.production_status == "producting"
      @order.update(order_status:2 )

    	
    end
    redirect_to admin_order_path(@orders_detail.order)#@orders_detailにすると違うページに行く理由がわからない。
 end
  private
  def orders_details_params
  	params.require(:orders_detail).permit(:production_status)
  	
  end
end

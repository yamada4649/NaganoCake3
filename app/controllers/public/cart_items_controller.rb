class Public::CartItemsController < ApplicationController
	before_action :cart_item_item?, only: [:create]
	def index
	  @cart_items = CartItem.all
	end
	def create
		@cart_item = CartItem.new(cart_item_params)#cart_itemにはamountが入ってるitemのshowの次はここに飛ばし、その後はindexページに飛ばす。
		@cart_item.end_user_id = current_end_user.id
		@cart_items = CartItem.all
		@cart_items.each do |cart_item|
      if cart_item.item_id == @cart_item.item_id
        new_amount = cart_item.amount + @cart_item.amount
        cart_item.update_attribute(:amount, new_amount)#条件に一致するレコードを更新してくれるもの。
        @cart_item.delete
        redirect_to cart_items_path
      elsif  @cart_item.save
         redirect_to cart_items_path
      else
        redirect_to request.referer

      end

   end
	end
  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to request.referer
    
  end
  def update
    cart_item = CartItem.find(params[:id])
    if cart_item.update(cart_item_params)
       redirect_back(fallback_location: cart_items_path)
    else
      flash[:notice] = "個数を入力してください!"
      redirect_back(fallback_location: cart_items_path)
    end
  end
  def destroy_all
    CartItem.destroy_all
    redirect_to cart_items_path
  end
	private
	def cart_item_item?
     if params[:cart_item][:amount].empty?
     redirect_to item_path(params[:item_id]),notice: "個数を入力してください。"
     end
    end
    def cart_item_params
  	params.require(:cart_item).permit(:amount,:item_id,:end_user_id)
    end
end

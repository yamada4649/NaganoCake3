class Public::ItemsController < ApplicationController
	  before_action :authenticate_end_user!,only: [:show]

 def top
    @genres = Genre.all
    @items = Item.all
 end
 def search
 	
 end
 def index
 	@genres = Genre.all
 	@items = Item.all
 	
 end
 def show
 	@item = Item.find(params[:id])
 	@cart_item = CartItem.new
 end
 private
  def item_params
    params.require(:item).permit(:name,:genre_id,:description,:sale_status,:notax_price,:product_image)
  end
end


class Admin::ItemsController < ApplicationController
	def top
	end
	def index
		 @items = Item.all
		 @genre = Genre.all
	end
	def edit
		
	end
	def destroy
		@item = Item.find(params[:id])
		@item.destroy
		redirect_to admin_items_path
		
	end
	def show
		@item = Item.find(params[:id])
	end
	def new
     @item = Item.new
     @item.images.build
     @genre = Genre.all
	end
	def create
     @item = Item.new(item_params)
     if @item.save
     	redirect_to admin_item_path(@item)
     else
     	render :new
     end
	end
	private
	 def item_params
    params.require(:item).permit(:name,:genre_id,:description,:sale_status,:notax_price,images_profile_images: [])
     end
end


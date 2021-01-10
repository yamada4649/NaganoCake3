class Public::FavoritesController < ApplicationController
	def create
		 @item = Item.find(params[:item_id])#ここの修正をするためにgit resetをしました。
		 @favorite = @item.favorites.new(end_user_id: current_end_user.id)
		 @favorite.save
		 redirect_to request.referer
	end
	def destroy
		@item = Item.find(params[:item_id])
		@favorite = @item.favorites.find_by(end_user_id: current_end_user.id)
		@favorite.destroy
		redirect_to request.referer
	end
end

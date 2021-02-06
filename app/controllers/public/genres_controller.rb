class Public::GenresController < ApplicationController
    before_action :authenticate_end_user!,only: [:show]
	def show
	@genre = Genre.find(params[:id])
	end
	private
    def genre_params
      params.require(:genre).permit(:name, :vail_flag)
    end
end

class Admin::GenresController < ApplicationController
	def new
  	@genres = Genre.all
  	@genre = Genre.new
	end
	def edit
	@genre = Genre.find(params[:id])
	end
	def create
	   @genre = Genre.new(genre_params)
  	if @genre.save
  	  flash[:notice] = "You have creatad genre successfully."
  	  redirect_to new_admin_genre_path
    else
      @genres = Genre.all
     render :new
    end
    end
    def update
     @genre = Genre.find(params[:id])
     if @genre.update(genre_params)
         redirect_to new_admin_genre_path
     else
     	render :edit
     end
    end
	private
    def genre_params
      params.require(:genre).permit(:name, :vail_flag)
    end
end

class Public::AddressesController < ApplicationController
	def index
  	@addresses = Address.all
  	@address = Address.new
    end
    def create
    	@address = Address.new(addresse_params)
    	@address.end_user_id = current_end_user.id
       if @address.save
       	 redirect_to edit_address_path(@address)
       else
       	 @addresses = Address.all
       	 render :index

       end
    end
    def edit
    	@addresse = Address.find(params[:id])
    end
    def update
    	addresse = Address.find(params[:id])
        addresse.update(addresse_params)
        redirect_to addresses_path
    end
    def destroy
    	addresse = Address.find(params[:id])
  	    addresse.destroy
  	    redirect_back(fallback_location: addresses_path)

    end
    private
    def addresse_params
  	 params.require(:address).permit(:end_user_id,:ship_address,:ship_toname,:postal_code)
    end
end

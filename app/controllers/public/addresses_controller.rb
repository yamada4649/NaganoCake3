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

        A,B =  gets.split.map(&:to_i)
        if A + B >= 15 && B >= 8
          
            puts 1
          
        elsif A + B >= 10 && B >= 3
          
            puts 2

          
        elsif A + B >= 3
           
            puts 3
           
        else
          
            puts 4
          

            
        end
            


    end
    private
    def addresse_params
  	 params.require(:address).permit(:end_user_id,:ship_address,:ship_toname,:postal_code)
    end
end

class Address < ApplicationRecord
    belongs_to :end_user
    validates :ship_address, presence: true
    validates :ship_toname, presence: true
    validates :postal_code, presence: true
       def address_all
		"〒" + postal_code + ship_address + ship_toname

	    end

end

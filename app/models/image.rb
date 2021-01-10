class Image < ApplicationRecord
	belongs_to :item
	attachment :profile_image


end

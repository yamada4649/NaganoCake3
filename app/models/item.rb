class Item < ApplicationRecord
   has_many :cart_items, dependent: :destroy
   has_many :orders_details,dependent: :destroy
   has_many :images,dependent: :destroy
   has_many :favorites,dependent: :destroy

   accepts_attachments_for :images, attachment: :profile_image
   belongs_to :genre
   attachment :product_image
   def favorited_by?(user)
       favorites.where(end_user_id: user.id).exists?
    end
   validate :name,:description,:notax_price,:genre_id
end

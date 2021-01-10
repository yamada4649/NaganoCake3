class RenameProfileImageColumnToImages < ActiveRecord::Migration[5.2]
  def change
  	    rename_column :images, :profile_image, :profile_image_id
  end
end

class RenameProfileImageIdColumnToImages < ActiveRecord::Migration[5.2]
  def change
     rename_column :images, :profile_image_id, :profile_image
  end
end

class ChangeVailFlagOfGenres < ActiveRecord::Migration[5.2]
  def change
    change_column :genres, :vail_flag, :boolean, default: true, null: false
  end
end

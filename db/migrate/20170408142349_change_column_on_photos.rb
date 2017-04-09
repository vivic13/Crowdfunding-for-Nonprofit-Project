class ChangeColumnOnPhotos < ActiveRecord::Migration[5.0]
  def change
  	remove_column :photos, :image
  	add_attachment :photos, :image
  end
end

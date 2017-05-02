class RemoveImageOnStories < ActiveRecord::Migration[5.0]
  def change
  	remove_column :stories , :image_file_name
  	remove_column :stories , :image_content_type
  	remove_column :stories , :image_file_size
  	remove_column :stories , :image_updated_at


  end
end

class CreateStories < ActiveRecord::Migration[5.0]
  def change
    create_table :stories do |t|
    	t.string :title
    	t.text :content
    	t.string :youtube_link
    	t.boolean :is_public ,:default => false
    	t.string :location
    	t.datetime :story_time
    	t.boolean :priority ,:default => false
      t.string :need_project ,:default => "no"
      t.text :reflection
      t.timestamps
    end
    add_attachment :stories, :image
    
  end
end

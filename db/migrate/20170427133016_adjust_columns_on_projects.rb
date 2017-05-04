class AdjustColumnsOnProjects < ActiveRecord::Migration[5.0]
  def change
  	#remove_column :projects, :project_id
  	#remove_column :projects, :cost
  	#remove_column :projects, :cost_detail
  	#remove_column :projects, :donation_file
  	#remove_column :projects, :description
  	#remove_column :projects, :npo_id
  	#add_column :projects, :story_id ,:integer
		#add_column :projects, :content,:text
		#rename_column :photos, :product_id, :project_id
		#rename_index :photos, :product_id, :project_id
    add_column :photos, :project_id ,:integer
    add_index :photos, :project_id
  end
end

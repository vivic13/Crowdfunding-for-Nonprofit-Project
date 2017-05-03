class AddIsPublicToReports < ActiveRecord::Migration[5.0]
  def change
  	add_column :reports, :is_public, :boolean, default: false
  	add_column :projects, :story_id ,:integer
  end
end

class RenameColumnOnProjects < ActiveRecord::Migration[5.0]
  def change
  	remove_column :projects , :donation_amount
  	add_column :projects, :donation_amount,:integer, default:0
  end
end

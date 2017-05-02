class AddNameOnDonation < ActiveRecord::Migration[5.0]
  def change
  	add_column :donations, :name, :string
  	remove_column :projects, :progress
  end
end

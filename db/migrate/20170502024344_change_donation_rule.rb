class ChangeDonationRule < ActiveRecord::Migration[5.0]
  def change
  	#remove_column :projects, :unit
  	#remove_column :projects, :unit_price
  	#remove_column :projects, :donation_unit_count
  	add_column :projects,:total_amount, :integer
  	#add_column :projects, :donantion_amount, :integer
  	#remove_column :donations, :unit
  	change_column :donations, :amount,:integer, :default => 500
  end
end

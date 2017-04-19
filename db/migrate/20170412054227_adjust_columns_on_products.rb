class AdjustColumnsOnProducts < ActiveRecord::Migration[5.0]
  def change
  	# remove_column :products, :amount
  	add_column :products , :unit , :integer
  	add_column :products , :unit_price , :integer
  	add_column :products , :due_date , :date
  	add_column :products , :donation_unit_count, :integer
  end
end

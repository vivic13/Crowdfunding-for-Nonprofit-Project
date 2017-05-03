class AdjustColumnsOnTablesForProductDesign < ActiveRecord::Migration[5.0]
  def change
  	#remove_column :products, :lucky_number
  	#remove_column :products, :lucky_person
  	#remove_column :products, :rule
  	#remove_column :products, :lottery_old_number
  	remove_column :donations, :status
  	#remove_column :donations, :lottery_number
  end
end

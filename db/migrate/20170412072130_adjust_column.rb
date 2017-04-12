class AdjustColumn < ActiveRecord::Migration[5.0]
  def change
  	remove_column :products, :min_amount
  	
  end
end

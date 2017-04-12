class AdjustColumnsOnProductsAndDonations < ActiveRecord::Migration[5.0]
  def change
  	change_column :products , :lottery_old_number, :text
  	change_column :donations , :lottery_number , :text
  end
end

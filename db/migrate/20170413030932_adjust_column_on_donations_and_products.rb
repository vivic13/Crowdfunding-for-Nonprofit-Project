class AdjustColumnOnDonationsAndProducts < ActiveRecord::Migration[5.0]
  def change
  	remove_column :products, :lottery_old_number
  	remove_column :donations, :lottery_number
  end
end

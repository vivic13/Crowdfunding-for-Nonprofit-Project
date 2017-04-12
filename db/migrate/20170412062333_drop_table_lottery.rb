class DropTableLottery < ActiveRecord::Migration[5.0]
  def change
  	drop_table :lotteries
  	add_column :donations , :lottery_number , :integer, array: true, default: []
  end
end

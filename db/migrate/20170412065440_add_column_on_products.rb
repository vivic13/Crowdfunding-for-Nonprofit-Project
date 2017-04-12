class AddColumnOnProducts < ActiveRecord::Migration[5.0]
  def change
  	add_column :products, :lottery_old_number, :text, array: true, default: []
  	add_column :donations, :lottery_number, :text, array: true, default: []
  end
end

class AddProgressOnProducts < ActiveRecord::Migration[5.0]
  def change
  	add_column :products, :progress, :float, default: 0
  end
end

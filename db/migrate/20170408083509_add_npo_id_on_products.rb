class AddNpoIdOnProducts < ActiveRecord::Migration[5.0]
  def change
  	add_column :products, :npo_id, :integer
  	add_index :products, :npo_id
  end
end

class RenameColumnsOnDonations < ActiveRecord::Migration[5.0]
  def change
  	#drop_table :npos
  	#remove_column :donations, :address
  	rename_column :donations , :product_id, :project_id
  	rename_index :donations , :product_id, :project_id
  	add_column :donations, :payment_method, :string
  	add_column :donations, :amount, :integer
  end
end

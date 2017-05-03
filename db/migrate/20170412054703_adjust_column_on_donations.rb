class AdjustColumnOnDonations < ActiveRecord::Migration[5.0]
  def change
  	#remove_column :donations, :amount
  	add_column :donations, :payment_status , :string , :default => 'new'
  	#add_column :donations, :unit , :integer, :default => 0

  end
end

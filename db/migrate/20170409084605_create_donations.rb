class CreateDonations < ActiveRecord::Migration[5.0]
  def change
    create_table :donations do |t|
    	t.integer :product_id
    	t.integer :user_id 
    	t.integer :amount
    	t.string :status
      t.timestamps
    end
    add_index :donations, :product_id
    add_index :donations, :user_id
  end
end

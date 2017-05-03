class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
    	t.string :name
    	#t.string :description 
    	#t.integer :lucky_number
    	#t.string :lucky_person
    	#t.integer :people
    	#t.integer :min_amount
    	#t.string :progress
    	#t.integer :project_id
    	#t.text :rule
    	#t.string :donation_file
    	#t.integer :cost
    	#t.text :cost_detail
      t.timestamps
    end
    #add_index :products, :project_id
  end
end

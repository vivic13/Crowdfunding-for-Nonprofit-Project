class CreateNpos < ActiveRecord::Migration[5.0]
  def change
    create_table :npos do |t|
    	t.integer :product_id
    	t.string :name
    	t.integer :code
    	t.text :philosophy
      t.timestamps
    end
    add_index :npos, :product_id
  end
end

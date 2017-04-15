class AddCompletedColumnOnProducts < ActiveRecord::Migration[5.0]
  def change
  	add_column :products, :done , :boolean, default: false
  end
end

class AddColumnOnDonations < ActiveRecord::Migration[5.0]
  def change
  	add_column :donations, :address, :text, default:""
  end
end

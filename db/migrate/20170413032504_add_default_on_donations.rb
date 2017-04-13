class AddDefaultOnDonations < ActiveRecord::Migration[5.0]
  def change
  	change_column_default :donations, :unit, default:1
  end
end

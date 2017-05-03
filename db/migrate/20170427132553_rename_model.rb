class RenameModel < ActiveRecord::Migration[5.0]
  def self.up
    rename_table :products, :projects
  end

  def self.down
    rename_table :projects, :products
  end
  
end

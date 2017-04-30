class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.integer :project_id
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end

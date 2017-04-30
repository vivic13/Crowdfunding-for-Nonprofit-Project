class CreatePhotofiles < ActiveRecord::Migration[5.0]
  def change
    create_table :photofiles do |t|
      t.references :story, foreign_key: true

      t.timestamps
    end
  end
end

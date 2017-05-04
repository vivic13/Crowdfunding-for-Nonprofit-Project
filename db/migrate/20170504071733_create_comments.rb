class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :commenter
      t.integer :story_id
      t.text :comment_body

      t.timestamps
    end
  end
end

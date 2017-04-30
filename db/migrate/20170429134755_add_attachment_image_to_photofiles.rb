class AddAttachmentImageToPhotofiles < ActiveRecord::Migration
  def self.up
    change_table :photofiles do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :photofiles, :image
  end
end

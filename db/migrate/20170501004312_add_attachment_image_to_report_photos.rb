class AddAttachmentImageToReportPhotos < ActiveRecord::Migration
  def self.up
    change_table :report_photos do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :report_photos, :image
  end
end

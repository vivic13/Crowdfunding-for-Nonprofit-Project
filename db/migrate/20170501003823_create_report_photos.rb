class CreateReportPhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :report_photos do |t|
      t.references :report, foreign_key: true

      t.timestamps
    end
  end
end

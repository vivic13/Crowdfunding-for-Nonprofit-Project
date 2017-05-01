class Report < ApplicationRecord
	belongs_to :project
	has_many :report_photos, dependent: :destroy
  accepts_nested_attributes_for :report_photos,:allow_destroy => true, :reject_if => :all_blank
end

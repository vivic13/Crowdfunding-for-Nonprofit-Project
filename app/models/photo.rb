class Photo < ApplicationRecord
	belongs_to :project, optional: true
	has_attached_file :image, styles: { medium: "300x300", thumb: "600x900" }
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end

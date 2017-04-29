class Story < ApplicationRecord
	has_many :projects
	has_attached_file :image,:default_url => 'upload_image.png', styles: { small: "100x100"}
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end

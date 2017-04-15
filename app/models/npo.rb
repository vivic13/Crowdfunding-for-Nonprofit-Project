class Npo < ApplicationRecord
	has_many :products
	has_attached_file :logo, styles: { small: "60x60>"}
	validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/
end

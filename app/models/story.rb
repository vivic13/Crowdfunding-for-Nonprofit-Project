class Story < ApplicationRecord
	has_one :project
	has_many :story_tags
	has_many :tags, :through => :story_tags
	has_many :photofiles, dependent: :destroy
	accepts_nested_attributes_for :photofiles,:allow_destroy => true, :reject_if => :all_blank
	has_attached_file :image,:default_url => 'upload_image.png', styles: { small: "100x100"}
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
	validates_presence_of :title, :content, :location, :story_time
end

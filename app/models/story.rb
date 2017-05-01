class Story < ApplicationRecord
	has_one :project
	has_many :story_tags
	has_many :tags, :through => :story_tags
	has_many :photofiles, dependent: :destroy
	has_many :likes
	has_many :users, :through => :likes
	accepts_nested_attributes_for :photofiles,:allow_destroy => true, :reject_if => :all_blank
	has_attached_file :image,:default_url => 'upload_image.png', styles: { small: "100x100"}
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
	validates_presence_of :title, :content, :location, :story_time

	def find_like(user)
		Like.find_by(:story => self, :user => user)
	end

	def already_liked(user)
		find_like(user).present?
	end

	def like_count
		self.likes.count
	end


end

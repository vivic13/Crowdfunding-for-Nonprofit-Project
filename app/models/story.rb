class Story < ApplicationRecord
	has_many :projects
	has_many :story_tags
	has_many :tags, :through => :story_tags
	has_many :photofiles, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :likes
	has_many :users, :through => :likes
	accepts_nested_attributes_for :photofiles,:allow_destroy => true, :reject_if => :all_blank
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

	def youtube_code		
		self.youtube_link.split("/").last
	end


end

class Project < ApplicationRecord
	has_many :photos, dependent: :destroy
	has_many :donations 
	belongs_to :story
	validates_presence_of :name,:unit,:unit_price, :content
	accepts_nested_attributes_for :photos,:allow_destroy => true, :reject_if => :all_blank
     
    has_one :report, dependent: :destroy

	def story_title
		self.story.title
	end
	
end

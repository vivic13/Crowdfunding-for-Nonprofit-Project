class Project < ApplicationRecord
	has_many :photos, dependent: :destroy
	has_many :donations 
	belongs_to :story
	validates_presence_of :due_date,:name, :content
	validates :total_amount, numericality: { only_integer: true }
	accepts_nested_attributes_for :photos,:allow_destroy => true, :reject_if => :all_blank
  has_one :report

	def story_title
		self.story.title
	end

	def progress 
		(self.donation_amount.to_f/self.total_amount)*100
	end
	
end


class Donation < ApplicationRecord
	belongs_to :project
	belongs_to :user
	validates_presence_of :unit
	after_validation :check_stock
	#after_save :update_project_column


	private

	def check_stock 
		stock = self.project.unit - self.project.donation_unit_count
		if self.unit > stock
			self.unit = stock 
		end
	end
	

	


	#def update_project_column


	#end

	



end

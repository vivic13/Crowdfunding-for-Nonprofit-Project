class Donation < ApplicationRecord
	belongs_to :project
	belongs_to :user
	has_many :payments
	validates_presence_of :unit
	after_validation :check_stock
	after_validation :calculate_amount
	#after_save :update_project_column

	def paid?
		self.payment_status == "Paid"
	end

	private

	def calculate_amount
		self.amount = self.unit.to_i * self.project.unit_price
	end

	def check_stock 
		stock = self.project.unit - self.project.donation_unit_count
		if self.unit > stock
			self.unit = stock 
		end
	end
	

	


	#def update_project_column


	#end

	



end

class Donation < ApplicationRecord
	belongs_to :project
	belongs_to :user
	has_many :payments
	validates_presence_of :name
	validates :amount, numericality: { only_integer: true }

	after_save :update_project_column

	def paid?
		self.payment_status == "Paid"
	end

	private


	def update_project_column
		if self.paid?
			@update_amount = self.project.donation_amount +  self.amount
			self.project.update(:donation_amount => @update_amount)
			if self.project.donation_amount >= self.project.total_amount
				self.project.update(:done => true)
			end
		end
	end

	



end

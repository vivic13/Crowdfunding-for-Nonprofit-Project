class Donation < ApplicationRecord
	belongs_to :product
	belongs_to :user
	validates_presence_of :unit, :address
	after_validation :check_stock
	#after_save :update_product_column


	private

	def check_stock 
		stock = self.product.unit - self.product.donation_unit_count
		if self.unit > stock
			self.unit = stock 
		end
	end
	

	


	#def update_product_column


	#end

	



end

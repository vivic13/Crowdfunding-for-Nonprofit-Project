class Donation < ApplicationRecord
	belongs_to :product
	belongs_to :user
	serialize :lottery_number, Array
	
	after_validation :create_lottery_number
	after_save :update_product_lottery_old_number_column


	private

	def create_lottery_number	
		unit = self.unit  #買了幾個單位，等於要產生幾個號碼
		max_number = self.product.unit  #產生的lottery 最大數字
		lottery_range = [*1..max_number]
		invalid_number = self.product.lottery_old_number
		valid_number = lottery_range - invalid_number
		self.lottery_number = valid_number.sample(unit)

	end

	def update_product_lottery_old_number_column
		old_number = self.lottery_number + self.product.lottery_old_number

		self.product.update(:lottery_old_number => old_number)


	end

	
	

end

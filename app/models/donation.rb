class Donation < ApplicationRecord
	belongs_to :product
	belongs_to :user
	serialize :lottery_number, Array
	validates_presence_of :unit, :address
	after_validation :check_stock
	before_save :create_lottery_number	
	after_save :update_product_column


	private

	def check_stock 
		stock = self.product.unit - self.product.donation_unit_count
		if self.unit > stock
			self.unit = stock 
		end
	end
	

	def create_lottery_number	
		
		unit = self.unit  #買了幾個單位，等於要產生幾個號碼
		max_number = self.product.unit  #產生的lottery 最大數字
		lottery_range = [*1..max_number]
		invalid_number = self.product.lottery_old_number
		valid_number = lottery_range - invalid_number
		self.lottery_number = valid_number.sample(unit)
	end


	def update_product_column
		old_number = self.lottery_number + self.product.lottery_old_number 
		self.product.update(:lottery_old_number => old_number) #紀錄已產生的樂透

		unit_sum = self.product.lottery_old_number.size 
		self.product.update(:donation_unit_count => unit_sum)	 #更新已賣出的units

		@progress = (unit_sum.to_f/self.product.unit)*100
		self.product.update(:progress => @progress)

		if @progress >= 100 
			self.product.update(:done => true)
		#	self.product.update(:is_public => false) #若要產品集資完成就下架首頁的話
		end

	end

	



end

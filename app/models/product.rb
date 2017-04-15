class Product < ApplicationRecord
	belongs_to :npo
	has_many :photos, dependent: :destroy
	has_many :donations 
	serialize :lottery_old_number, Array
	validates_presence_of :due_date,:name,:description,:rule ,:unit,:unit_price,:cost,:cost_detail

	accepts_nested_attributes_for :photos,:allow_destroy => true, :reject_if => :all_blank
end

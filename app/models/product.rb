class Product < ApplicationRecord
	belongs_to :npo
	has_many :photos, dependent: :destroy
	has_many :donations 
	serialize :lottery_old_number, Array
	accepts_nested_attributes_for :photos,:allow_destroy => true, :reject_if => :all_blank
end

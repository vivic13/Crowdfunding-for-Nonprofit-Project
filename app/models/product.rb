class Product < ApplicationRecord
	belongs_to :npo
	has_many :photos, dependent: :destroy
	has_many :donations 
	validates_presence_of :due_date,:name,:description ,:unit,:unit_price,:cost,:cost_detail
	accepts_nested_attributes_for :photos,:allow_destroy => true, :reject_if => :all_blank
end

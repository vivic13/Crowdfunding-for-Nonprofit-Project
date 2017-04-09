class Product < ApplicationRecord
	belongs_to :npo
	has_many :photos, dependent: :destroy
	has_many :donations 
	accepts_nested_attributes_for :photos,:allow_destroy => true, :reject_if => :all_blank
end

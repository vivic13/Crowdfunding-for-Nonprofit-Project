class Product < ApplicationRecord
	belongs_to :npo
	has_many :photos, dependent: :destroy
end

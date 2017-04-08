class Product < ApplicationRecord
	has_many :npos, dependent: :destroy
	has_many :photos, dependent: :destroy
end

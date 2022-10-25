class Kitchen < ApplicationRecord
  has_many :recipes
  has_many :items
end

class Recipe < ApplicationRecord
  has_many :ingredients, dependent: :destroy
  belongs_to :menu
  belongs_to :kitchen
end

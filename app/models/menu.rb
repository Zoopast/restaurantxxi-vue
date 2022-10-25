class Menu < ApplicationRecord
  has_many :recipes, dependent: :delete_all
end

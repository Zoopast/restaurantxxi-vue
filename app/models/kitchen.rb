# == Schema Information
#
# Table name: kitchens
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Kitchen < ApplicationRecord
  has_many :recipes
  has_many :items
end

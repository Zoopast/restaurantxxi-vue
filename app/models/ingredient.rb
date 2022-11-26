# == Schema Information
#
# Table name: ingredients
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  qty        :float
#  unit       :string(255)      default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  recipe_id  :integer          not null
#
class Ingredient < ApplicationRecord
  belongs_to :recipe
end

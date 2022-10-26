# == Schema Information
#
# Table name: ingredients
#
#  id         :integer          not null, primary key
#  name       :string
#  qty        :float
#  unit       :string           default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  recipe_id  :integer          not null
#
FactoryBot.define do
  factory :ingredient do
    
  end
end

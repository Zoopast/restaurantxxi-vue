# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  order_id   :integer          not null
#  recipe_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  bill_id    :integer
#
FactoryBot.define do
  factory :product do
    
  end
end

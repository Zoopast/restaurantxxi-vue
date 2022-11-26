# == Schema Information
#
# Table name: items
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  price        :integer
#  stock        :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  inventory_id :integer          not null
#  kitchen_id   :integer
#
FactoryBot.define do
  factory :item do
    
  end
end

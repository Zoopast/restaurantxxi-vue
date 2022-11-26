# == Schema Information
#
# Table name: units
#
#  id          :integer          not null, primary key
#  measurement :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :unit do
    measurement { 1 }
  end
end

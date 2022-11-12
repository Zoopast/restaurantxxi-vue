# == Schema Information
#
# Table name: expenses
#
#  id          :integer          not null, primary key
#  amount      :integer          not null
#  description :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :expense do
    
  end
end

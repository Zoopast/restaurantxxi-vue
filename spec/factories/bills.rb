# == Schema Information
#
# Table name: bills
#
#  id             :integer          not null, primary key
#  amount         :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  client_id      :integer          not null
#  transaction_id :integer          not null
#
FactoryBot.define do
  factory :bill do
    
  end
end

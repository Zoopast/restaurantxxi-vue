# == Schema Information
#
# Table name: orders
#
#  id             :integer          not null, primary key
#  total          :integer
#  client_id      :integer          not null
#  table_id       :integer          not null
#  reservation_id :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
FactoryBot.define do
  factory :order do
    total { 1 }
  end
end

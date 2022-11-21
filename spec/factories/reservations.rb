# == Schema Information
#
# Table name: reservations
#
#  id                   :integer          not null, primary key
#  reservation_datetime :datetime
#  status               :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  number_of_people     :integer          not null
#  client_id            :integer          not null
#  table_id             :integer          not null
#
FactoryBot.define do
  factory :reservation do
    reservation_datetime { "2022-11-12 09:49:07" }
    status { 1 }
  end
end

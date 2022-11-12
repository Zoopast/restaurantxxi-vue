# == Schema Information
#
# Table name: tables
#
#  id           :integer          not null, primary key
#  reserved_at  :datetime
#  seats        :integer
#  table_number :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
FactoryBot.define do
  factory :table do
    reserved_at { "2022-11-12 09:46:56" }
    seats { 1 }
    table_number { 1 }
  end
end

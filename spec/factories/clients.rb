# == Schema Information
#
# Table name: clients
#
#  id         :integer          not null, primary key
#  full_name  :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :client do
    full_name { "MyString" }
    email { "MyString" }
  end
end

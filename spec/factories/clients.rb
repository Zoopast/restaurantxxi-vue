# == Schema Information
#
# Table name: clients
#
#  id                     :integer          not null, primary key
#  full_name              :string
#  email                  :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  last_visited           :datetime
#
FactoryBot.define do
  factory :client do
    full_name { "MyString" }
    email { "MyString" }
  end
end

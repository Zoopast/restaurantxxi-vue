# == Schema Information
#
# Table name: clients
#
#  id                     :integer          not null, primary key
#  full_name              :string(255)
#  email                  :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
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

# == Schema Information
#
# Table name: jwt_denylist
#
#  id         :integer          not null, primary key
#  jti        :string(255)      not null
#  exp        :datetime         not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :jwt_denylist do
    jti { "MyString" }
    exp { "2022-10-20 20:39:22" }
  end
end

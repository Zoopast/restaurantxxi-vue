FactoryBot.define do
  factory :jwt_denylist do
    jti { "MyString" }
    exp { "2022-10-20 20:39:22" }
  end
end

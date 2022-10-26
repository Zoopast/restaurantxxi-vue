# == Schema Information
#
# Table name: recipes
#
#  id          :integer          not null, primary key
#  name        :string           default(""), not null
#  preparation :text             default(""), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  menu_id     :integer          not null
#  kitchen_id  :integer
#
FactoryBot.define do
  factory :recipe do
    
  end
end

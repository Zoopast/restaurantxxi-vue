# == Schema Information
#
# Table name: menus
#
#  id           :integer          not null, primary key
#  name         :string           default(""), not null
#  description  :text             default(""), not null
#  default_menu :boolean          default(FALSE), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
FactoryBot.define do
  factory :menu do
    
  end
end

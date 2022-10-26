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
class Menu < ApplicationRecord
  has_many :recipes, dependent: :delete_all
end

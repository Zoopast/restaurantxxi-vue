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
#  description :string
#
class Recipe < ApplicationRecord
  has_many :ingredients, dependent: :destroy
  belongs_to :menu
  belongs_to :kitchen
end

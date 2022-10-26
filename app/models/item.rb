# == Schema Information
#
# Table name: items
#
#  id           :integer          not null, primary key
#  name         :string
#  price        :integer
#  stock        :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  inventory_id :integer          not null
#  kitchen_id   :integer
#
class Item < ApplicationRecord
  belongs_to :inventory
end

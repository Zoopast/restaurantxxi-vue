# == Schema Information
#
# Table name: inventories
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Inventory < ApplicationRecord
  has_many :items
end

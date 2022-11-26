# == Schema Information
#
# Table name: units
#
#  id          :integer          not null, primary key
#  measurement :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Unit < ApplicationRecord
  enum :measurement, %i[oz lb g kg ml l tsp tbsp cup unit]
end

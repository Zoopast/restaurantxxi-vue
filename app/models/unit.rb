class Unit < ApplicationRecord
  enum :measurement, %i[oz lb g kg ml l tsp tbsp cup unit]
end

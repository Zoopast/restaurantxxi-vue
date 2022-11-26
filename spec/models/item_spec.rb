# == Schema Information
#
# Table name: items
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  price        :integer
#  stock        :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  inventory_id :integer          not null
#  kitchen_id   :integer
#
require 'rails_helper'

RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

# == Schema Information
#
# Table name: orders
#
#  id             :integer          not null, primary key
#  total          :integer
#  client_id      :integer          not null
#  table_id       :integer          not null
#  reservation_id :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
require 'rails_helper'

RSpec.describe Order, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

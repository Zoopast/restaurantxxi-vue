# == Schema Information
#
# Table name: expense_items
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  price      :integer          not null
#  quantity   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  expense_id :integer          not null
#
require 'rails_helper'

RSpec.describe ExpenseItem, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

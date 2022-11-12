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
class ExpenseItem < ApplicationRecord
  belongs_to :expense
end

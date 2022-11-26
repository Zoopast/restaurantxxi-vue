# == Schema Information
#
# Table name: expenses
#
#  id          :integer          not null, primary key
#  amount      :integer          not null
#  description :string(255)      not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Expense < ApplicationRecord
  has_many :expense_items, dependent: :destroy
  accepts_nested_attributes_for :expense_items, allow_destroy: true
end

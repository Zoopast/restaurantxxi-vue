# == Schema Information
#
# Table name: expenses
#
#  id          :integer          not null, primary key
#  amount      :integer          not null
#  description :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe Expense, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

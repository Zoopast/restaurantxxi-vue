# == Schema Information
#
# Table name: transactions
#
#  id               :integer          not null, primary key
#  date             :datetime         default(Sat, 26 Nov 2022 20:32:33.987882000 UTC +00:00), not null
#  transaction_type :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Transaction < ApplicationRecord
  enum :transaction_type, [:expense, :income]
  has_one :bill
end

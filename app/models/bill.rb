# == Schema Information
#
# Table name: bills
#
#  id             :integer          not null, primary key
#  amount         :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  client_id      :integer          not null
#  transaction_id :integer          not null
#
class Bill < ApplicationRecord
  belongs_to :client, optional: true
  belongs_to :owner, foreign_key: "transaction_id", class_name: "Transaction"
end

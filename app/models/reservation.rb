# == Schema Information
#
# Table name: reservations
#
#  id                   :integer          not null, primary key
#  reservation_datetime :datetime
#  status               :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  number_of_people     :integer          not null
#  client_id            :integer          not null
#  table_id             :integer          not null
#
class Reservation < ApplicationRecord
  belongs_to :client
  belongs_to :table
  enum :status, %i[active finished cancelled filed scheduled]
  has_one :order
end

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
require 'rails_helper'

RSpec.describe Reservation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

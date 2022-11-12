# == Schema Information
#
# Table name: tables
#
#  id           :integer          not null, primary key
#  reserved_at  :datetime
#  seats        :integer
#  table_number :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Table < ApplicationRecord
end

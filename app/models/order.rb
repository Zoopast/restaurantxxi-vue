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
class Order < ApplicationRecord
  belongs_to :client
  has_many :products
  belongs_to :reservation
  belongs_to :table

  def calculate_total
    if self.total.nil?
      total = 0
      products.each do |product|
        total += product.recipe.price
      end
      self.update! total: total
      total
    else
      self.total
    end
  end
end

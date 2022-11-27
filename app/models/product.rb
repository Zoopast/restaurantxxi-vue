# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  order_id   :integer          not null
#  recipe_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  bill_id    :integer
#
class Product < ApplicationRecord
  belongs_to :recipe
  belongs_to :order

  enum :status, %i[ordered ready delivered]
end

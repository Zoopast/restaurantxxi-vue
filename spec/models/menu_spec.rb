# == Schema Information
#
# Table name: menus
#
#  id           :integer          not null, primary key
#  name         :string           default(""), not null
#  description  :text             default(""), not null
#  default_menu :boolean          default(FALSE), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'rails_helper'

RSpec.describe Menu, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

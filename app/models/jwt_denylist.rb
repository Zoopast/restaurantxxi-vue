# == Schema Information
#
# Table name: jwt_denylist
#
#  id         :integer          not null, primary key
#  jti        :string(255)      not null
#  exp        :datetime         not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class JwtDenylist < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Denylist

  self.table_name = 'jwt_denylist'
end

class Contract < ApplicationRecord
  belongs_to :user
  has_one :contract
end

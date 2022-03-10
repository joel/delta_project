class Contract < ApplicationRecord
  attribute :title, :string, default: -> { FFaker::Conference.name }
  attribute :content, :text, default: -> { FFaker::Lorem.paragraph }

  belongs_to :user
  has_one :contract
end

# frozen_string_literal: true

class User < ApplicationRecord
  attribute :first_name, :string, default: -> { FFaker::Name.first_name }
  attribute :last_name, :string, default: -> { FFaker::Name.last_name }
  attribute :email, :string, default: -> { FFaker::Internet.email }
  attribute :birthday, :datetime, default: -> { (10..99).to_a.sample.years.ago }
  attribute :bio, :text, default: -> { FFaker::Lorem.paragraph }

  has_one :contract, dependent: :destroy

  def name
    "#{first_name} #{last_name}"
  end
end

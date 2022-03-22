# frozen_string_literal: true

class Contract < ApplicationRecord
  include ActiveModel::Serializers::JSON

  attribute :title, :string, default: -> { FFaker::Conference.name }
  attribute :content, :text, default: -> { FFaker::Lorem.paragraph }

  belongs_to :user
  has_one :contract

  has_one_attached :document

  broadcasts_to :user

  scope :approved, -> { where.not(approved_at: nil) }

  def self.verification_code_valid?(params)
    params[:verification_code] =~ /^\d{6}$/
  end
end

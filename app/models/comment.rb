# frozen_string_literal: true

class Comment < ApplicationRecord
  attribute :content, :text, default: -> { FFaker::Lorem.paragraph }

  belongs_to :post
  broadcasts_to :post
end

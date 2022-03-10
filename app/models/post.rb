class Post < ApplicationRecord
  attribute :title, :string, default: -> { FFaker::Book.title }
  attribute :content, :text, default: -> { FFaker::Lorem.paragraph }

  validates :title, presence: true
  has_rich_text :content
  has_many :comments, dependent: :destroy
end

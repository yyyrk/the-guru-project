class Category < ApplicationRecord
  has_many :tests, dependent: :destroy

  validates :title, presence: true
end

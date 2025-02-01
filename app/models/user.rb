class User < ApplicationRecord
  has_many :test_results, dependent: :destroy
  has_many :tests, through: :test_results, dependent: :destroy
  has_many :author_tests, class_name: "Test", foreign_key: "author_id"

  validates :name, presence: true
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false } # чтобы игнорировать регистр

  def tests_by_level(level)
    tests.where(level: level)
  end
end

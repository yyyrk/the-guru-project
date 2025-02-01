class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true

  validate :validate_answers_count, on: :create

  scope :correct, -> { where(correct: true) }

  def validate_answers_count
    return if question.answers.count < 4

    errors.add(:question, "Too many answers!!! (must be less then 5!!!)")
  end
end

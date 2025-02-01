class Answer < ApplicationRecord
  belongs_to :question

  validates :body, presence: true
  validate :validate_answers_count, on: :create

  scope :correct, -> { where(correct: true) }

  private

  def validate_answers_count
    errors.add(:question, "Too many answers! (must be less than 5)") if question.answers.size >= 4
    errors.add(:question, "At least one answer is required") if question.answers.size < 1
  end
end

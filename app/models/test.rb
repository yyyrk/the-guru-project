class Test < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "author_id"
  belongs_to :category

  has_many :test_results, dependent: :destroy
  has_many :users, through: :test_results
  has_many :questions, dependent: :destroy

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :easy, -> { where(level: [ 0, 1 ]) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where("level >= ?", 5) }
  scope :by_level, ->(level) { where(level: level) }
  scope :by_category_name, ->(category_name) {
    joins(:category)
      .where(categories: { title: category_name })
      .order(title: :desc)
  }

  # Добавил отдельный метод для получения массива заголовков с плак
  def self.titles_by_category(category_name)
    by_category_name(category_name).pluck(:title)
  end
end

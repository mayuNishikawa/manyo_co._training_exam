class Task < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }
  validates :content, presence: true, length: { maximum: 200 }

  enum status: { not_yet: 0, doing: 1, done: 2 }
  enum priority: { high: 0, medium: 1, low: 2 }

  scope :search_by_both, ->(pulldown, keyword){ where(status: "#{pulldown}").where('name LIKE ?', "%#{keyword}%") }
  scope :search_by_status, ->(pulldown){ where(status: "#{pulldown}") }
  scope :search_by_name, ->(keyword){ where('name LIKE ?', "%#{keyword}%") }

  belongs_to :user, dependent: :destroy
end

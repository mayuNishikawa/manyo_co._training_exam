class Task < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }
  validates :content, presence: true, length: { maximum: 200 }

  scope :search, ->(keyword){ where('name LIKE ?', "%#{keyword}%") }
end

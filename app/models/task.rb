class Task < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }
  validates :content, presence: true, length: { maximum: 200 }
end

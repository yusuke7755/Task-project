class Task < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true, length: { in: 1..200 }
end

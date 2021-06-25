class Task < ApplicationRecord
  validates :title, presence: true, length: { maximum: 100 }
  validates :content, presence: true,length: { maximum: 400 }
  validates :deadline, presence: true
  validates :status, presence: true
  validates :priority, presence: true
  scope :title_search, -> (params) {where('(title LIKE ?)',"#{params[:task][:title]}")}
  scope :status_search, -> (params) {where(status: params[:task][:status])}
  enum status: { not_yet: 0, in_progress: 1, completed: 2 }
  enum priority: { high: 0, middle: 1, low: 2 }
end

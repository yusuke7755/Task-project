class Task < ApplicationRecord
  validates :title, presence: true, length: { maximum: 100 }
  validates :content, presence: true,length: { maximum: 400 }
  validates :deadline, presence: true
  validates :status, presence: true
  validates :priority, presence: true

  enum status: { not_yet: 0, in_progress: 1, completed: 2 }
  enum priority: { high: 1, middle: 2, low: 3 }
  
  belongs_to :user
  
  scope :search_tasks, ->(pr) {
    if pr[:word].present? && pr[:status].present?
      title_status_search(pr[:word], pr[:status])
    elsif pr[:word].present?
      title_search(pr[:word])
    elsif pr[:status].present?
      status_search(pr[:status])
    end
  }

  scope :title_status_search, ->(wd, st) {
    tasks = Task.where("title LIKE ?", "%#{wd}%")
    @tasks = tasks.where(status: st)
  }

  scope :title_search, ->(wd) {
    @tasks = Task.where("title LIKE ?", "%#{wd}%")
  }

  scope :status_search, ->(st) {
    @tasks = Task.where(status: st)
  }

end

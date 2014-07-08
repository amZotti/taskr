class Task < ActiveRecord::Base
validates :title, presence: true
validates :body, presence: true

  def self.not_completed
    where(completed: false)
  end

  def self.completed
    where(completed: true)
  end
end

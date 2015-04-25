class Milestone < ActiveRecord::Base
  belongs_to :project
  has_many :tasks

  def active_tasks
    self.tasks.where.not(completed: true)
  end

end

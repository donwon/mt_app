class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  has_many :assignments
  has_many :assignees, through: :assignments, source: :user

  after_initialize :set_due_date

  def set_due_date
     self.due_date = (Time.now + 1.days) 
  end

end

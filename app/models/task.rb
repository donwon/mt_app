class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  has_many :assignments
  has_many :assignees, through: :assignments, source: :user

end

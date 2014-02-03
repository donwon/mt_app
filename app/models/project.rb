class Project < ActiveRecord::Base
belongs_to :user

has_many :tasks
has_many :users, through: :tasks, source: :user

has_many :discussions
has_many :users, through: :discussions, source: :user

has_many :comments, through: :discussions, source: :comment


end

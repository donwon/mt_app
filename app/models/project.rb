class Project < ActiveRecord::Base
belongs_to :user

has_many :tasks
has_many :users, through: :tasks, source: :user

has_many :discussions
has_many :users, through: :discussions, source: :user

has_many :comments, as: :commentable
has_many :commenters, through: :comments, source: :user

after_initialize :set_defaults
  #Scope that orders projects by hit count
  scope :order_by_hits, -> { order("hit_counter DESC") } #doesnt expect pipes
  scope :x_most_recent, lambda { |max| order("updated_at DESC").limit(max) }
  scope :test, Proc.new { |max| order("created_at DESC").limit(max) }
  scope :x_by_votes, lambda { |max| order("score DESC").limit(max) }

private
def set_defaults
  self.hit_counter ||= 0
end


end

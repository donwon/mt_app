class Discussion < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  has_many :comments
  has_many :users, through: :comments, source: :user

end

class Comment < ActiveRecord::Base
  belongs_to :user
  #belongs_to :discussion
  belongs_to :commentable, polymorphic: true
  #validates_presence_of :body
  #validates_uniqueness_of :commentable_id, scope: [:user_id, :commentable_type]
  #doesn't need to be unique. 
end

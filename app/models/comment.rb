class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :discussion

  validates_length_of :body, minimum: 5

end

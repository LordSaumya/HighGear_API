class Comment < ApplicationRecord
  belongs_to :User
  belongs_to :Forum_Thread
end

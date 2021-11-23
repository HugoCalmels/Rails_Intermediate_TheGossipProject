class Comment < ApplicationRecord
  belongs_to :gossip
  belongs_to :user
  belongs_to :like
  has_many :poly_comments, as: :commentable 
end

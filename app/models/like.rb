class Like < ApplicationRecord
  belongs_to :user
  belongs_to :gossip, optional: true
  has_many :comments, dependent: :destroy
end

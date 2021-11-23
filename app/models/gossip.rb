class Gossip < ApplicationRecord
  belongs_to :user
  belongs_to :like
  has_many :gossip_tags
  has_many :tags, through: :gossip_tags
  has_many :comments, dependent: :destroy
end

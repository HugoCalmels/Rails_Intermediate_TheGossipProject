class Gossip < ApplicationRecord
  belongs_to :user
  belongs_to :like, optional: true
  has_many :gossip_tags
  has_many :tags, through: :gossip_tags
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :title, presence: true, length: { in: 3..14 }

  validates :content, presence: true
end

class Like < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :gossips, dependent: :destroy
end

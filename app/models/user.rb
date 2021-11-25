class User < ApplicationRecord
  has_secure_password
  validates :password, presence: true
  belongs_to :city
  has_many :gossips, dependent: :destroy
  has_many :sent_messages, foreign_key: 'sender_id', class_name: "PrivateMessage"
  has_many :received_messages, foreign_key: 'recipient_id', class_name: "PrivateMessage"
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

end

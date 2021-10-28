class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :articles
  has_many :comments
  has_many :following, foreign_key: 'follower_id', class_name: 'Relationship'
  has_many :followers, foreign_key: 'followed_id', class_name: 'Relationship'
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :username, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

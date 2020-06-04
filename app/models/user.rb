class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  has_many :likes, dependent: :destroy
  has_many :posts
  has_many :comments
  has_many :reactions
  has_many :sads, dependent: :destroy
  has_many :loves, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

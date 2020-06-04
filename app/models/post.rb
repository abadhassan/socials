class Post < ApplicationRecord
	belongs_to :user

	has_many :comments, dependent: :destroy
	has_many :likes, dependent: :destroy
    has_many :reactions
    has_many :sads, dependent: :destroy
    has_many :love_reactions, dependent: :destroy
	validates :title , presence: true,
	                   length: {minimum:5}
end

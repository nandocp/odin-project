class Post < ApplicationRecord
	validates :title, presence: { message: "must be chosen" }
	validates :body, presence: { message: "can't be blank" }
	belongs_to :user
	has_many :comments
end

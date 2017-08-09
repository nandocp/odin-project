class Post < ApplicationRecord
	belongs_to :member
	validates :body, presence: {message: "Quero ver veneno!"}
end

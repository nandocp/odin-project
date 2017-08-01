class Comment < ApplicationRecord
	validates :body, presence: { message: "can't be blank, dahlin'!!!" }
	belongs_to :user
	belongs_to :post
end

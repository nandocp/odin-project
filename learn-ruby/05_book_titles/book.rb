class Book
# write your code here
	attr_accessor :title

	def title
	i = 0
		while i < @title.length
			return @title.capitalize
			i += 1
		end
	end
end

class Book
# write your code here
	attr_accessor :title

	def title
		tit = @title.split
		i = 1
		cap = []

		cap << tit[0].capitalize
		while i < tit.length
			if tit[i] === "and" || tit[i] === "in" || tit[i] === "the" || tit[i] === "of" || tit[i] === "a" || tit[i] === "an"
				cap << tit[i]
			else
				cap << tit[i].capitalize
			end
			i += 1
		end
		return cap.join(" ")
	end

end
=begin
Implement a method #stock_picker that takes in an array of 
stock prices, one for each hypothetical day. 
It should return a pair of days representing the best day to 
buy and the best day to sell. Days start at 0.
* buy before sell
  > stock_picker([17,3,6,9,15,8,6,1,10])
  => [1,4]  # for a profit of $15 - $3 == $12
=end

def stock_picker(arr)
	compra = 0
	venda = 0
	c = 0
	v = arr.length - 1
	picker = []
	
	arr.each_with_index do |stock, day|
		
	end



	while v > 0
		arr.index(v)
		v -= 1
	end
	return picker
end

stock_picker([17,3,6,9,15,8,6,1,10])

# arr.index
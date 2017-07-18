#write your code here
def ftoc(fah)
	celsius = (fah-32) / 1.8
	return celsius.round
end

def ctof(cel)
	fahrenheit = ((1.8*cel) + 32)
	return fahrenheit
end
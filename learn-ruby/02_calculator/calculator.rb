#write your code here
def add(a, b)
	return a + b
end

def subtract (a, b)
	return a - b
end

def sum(arr)
	cont = 0
	sum = 0
	while cont < arr.length
		if arr == []
			return 0
		else
		sum += arr[cont]
		cont += 1
		end
	end
	return sum
end

def multiply(a, *b)
	b << a
	cont = 0
	mult = 1
	while cont < b.length
		mult *= b[cont]
		cont += 1
	end
	return mult
end

def power (a, b)
	pwr = 1
	cont = 1
	while cont <= b
		pwr *= a
		cont += 1
	end
	return pwr
end

def factorial(num)
	fator = 1
	cont = 1
	case num
	when 0
		return fator
	when 1
		return fator
	else
		while cont < num
			fator *= num
			num -= 1
		end
	end
	return fator
end
=begin
"In cryptography, a Caesar cipher, also known as Caesar's 
cipher, the shift cipher, Caesar's code or Caesar shift, is 
one of the simplest and most widely known encryption techniques.
It is a type of substitution cipher in which each letter in the
plaintext is replaced by a letter some fixed number of positions 
down the alphabet. For example, with a left shift of 3, 
D would be replaced by A, E would become B, and so on. 
The method is named after Julius Caesar, who used it in his 
private correspondence." - from Wikipedia

TASK:
Implement a caesar cipher that takes in a string and the shift
factor and then outputs the modified string:
  > caesar_cipher("What a string!", 5)
  => "Bmfy f xywnsl!"
=end

def caesar_cipher(str, num)
	palavras = str.split(" ")
	letras = []
	i = 0
	result_caesar = []

	while i <= palavras.length - 1
		letras = palavras[i].chars
		ordinal = "" # arr com os números ordinais + num

		letras.each do |char|
			if char.ord <= 64 || char.ord >= 123 # caracteres especiais
				ordinal << char.ord.chr
			elsif char.ord + num >= 65 && char.ord + num <= 90 || char.ord + num >= 97 && char.ord + num <= 122
				ordinal << (char.ord + num).chr
			elsif char.ord + num > 90 && char.ord + num < 97 || char.ord + num > 122
				ordinal << (char.ord + num - 26).chr
			end
		end
		i += 1
		result_caesar << ordinal
	end

	return result_caesar.join(' ')

end

puts caesar_cipher("What a string!", 5)
#write your code here
def echo(str)
	return str
end

def shout(str)
	return str.upcase
end

def repeat(str, num=2)
  case num
  when 0
    resp = "#{str} #{str}"
    return resp
  else
    stoa = []
    stoa << str
    rep = stoa.cycle(num).to_a.join(' ')
    return rep
  end
end

def start_of_word(word, num=1)
  if num-1 == 0
    primeira_letra = word[num-1]
    return primeira_letra
  else
    i = 0
    arr = []
    while i <= num-1
      letras = word[i]
      arr << letras
      i += 1
    end
    return arr.join
  end
end

def first_word(str)
  arr = str.split
  return arr[0]
end

def titleize(str)
  arr = str.split
  cont = 1
  cont_interno = 1
  temp = ""
  capitalized = []

  capitalized << arr[0].split.map(&:capitalize).join
  while arr.length - 1 >= cont
    while cont_interno <= arr.length - 1
      temp = arr[cont_interno]
      if temp[0] == temp[0].downcase && temp.length >= 4
        temp[0] = temp[0].upcase
        capitalized << temp
      else
        capitalized << temp
      end
      cont_interno += 1
    end
    cont += 1
  end
  return capitalized.join(' ')
end
# converter str em arr. iterar sobre cada elemento, capitalizando
# a primeira letra de cada palavra. ==> OK.
# SE a palavra estiver na primeira posição da array, capitalizar
# SENÃO, SE cada palavra presente na array a partir, incluindo,
# da segunda posição:
# #se arr.length == 3 não capitalizar E
#                     adicionar a capitalized[].
# #senão, capitaliza.
#         E adiciona a capitalized[]
=begin
  if arr[0].temp[0] == arr[0].temp[0].downcase
     arr[0].temp[0] = arr[0].temp[0].upcase
     capitalized << arr[0].temp[0]
=end
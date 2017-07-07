#write your code here
def translate(str)
  arr_palavras = str.split
  i = 0
  j = 0
  const = "ay"
  result = []

  while i < arr_palavras.length
  str_palavra = arr_palavras[i]
  particula = ""
    if /[aeiou]/ === str_palavra[0]
      result << str_palavra + const
    else
      if str_palavra[0] === "q" && str_palavra[1] ==="u"
        particula << str_palavra.slice!(0..1)
      elsif /[aeiou]/ != str_palavra[0] && /[aeiou]/ === str_palavra[1]
        particula << str_palavra.slice!(0)
      elsif /[aeiou]/ != str_palavra[0] && /[aeiou]/ != str_palavra[1] && /[aeiou]/ != str_palavra[2] && /[aeiou]/ === str_palavra[3]
        particula << str_palavra.slice!(0..2)
      elsif /[aeiou]/ != str_palavra[0] && /[aeiou]/ != str_palavra[1] && /[aeiou]/ === str_palavra[2]
        particula << str_palavra.slice!(0..1)
      end
      result << str_palavra + particula + const
    end
    i += 1
  end
  return result.join(" ")
end
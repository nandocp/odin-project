require 'rest-client'

print "Digite sua busca: "
busca = gets.chomp
pedido = RestClient.get 'http://www.bing.com/search', {q: busca}

puts "O pedido foi #{pedido.request}"
puts "O código de resposta da sua busca é #{pedido.code}"
puts "Os cookies retornados são #{pedido.cookies}"
puts "Os headers da solicitação são #{pedido.headers}"
puts "Raw headers: #{pedido.raw_headers}"
puts "Cookies jar: #{pedido.cookie_jar}"
puts "Você quer ver o <body> da sua solicitação? S ou N"
resp = gets.chomp.capitalize
if resp == "S"
	puts "O conteúdo é #{pedido.body}"
end

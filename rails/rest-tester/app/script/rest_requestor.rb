require 'rest-client'

puts "Which REST action do you want to check?"
puts "1: index (GET)"
puts "2: show (GET)"
puts "3: new (GET)"
puts "4: edit (GET)"
puts "5: create (POST)"
print "Option: "
op = gets.chomp.to_i
url = ""

case op
when 1
	url = "http://localhost:3000/users"
	puts RestClient.get(url)
when 2
	url = "http://localhost:3000/users/1"
	puts RestClient.get(url)
when 3
	url = "http://localhost:3000/users/new"
	puts RestClient.get(url)
when 4
	url = "http://localhost:3000/users/1/edit"
	puts RestClient.get(url)
when 5
	url = "http://localhost:3000/users"
	puts RestClient.post(url, {param1: 'one'})
else
	puts "Must be an option between 1 and 5"
end

# 5 will throw an error because POST, DELETE AND PATCH
# require a token. Server message:
# Can't verify CSRF token authenticity.
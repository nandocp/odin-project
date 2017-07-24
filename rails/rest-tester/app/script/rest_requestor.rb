require 'rest-client'

page = RestClient.get 'http://www.blizzard.com'
	
@vars = {
					request: page.request,
					response: page.code,
					cookies: page.cookies,
					cookie_jar: page.cookie_jar,
					headers: page.headers,
					body: page.body
				 }
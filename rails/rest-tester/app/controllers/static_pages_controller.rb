require 'rest-client'

class StaticPagesController < ApplicationController
	def home
		page = RestClient.get 'http://www.bing.com/search', {q: 'rupaul'}
		
		@request = page.request					
		@code = page.code
		@cookies = page.cookies
		@cookie_jar = page.cookie_jar
		@headers = page.headers
		@body = page.body
	end
end

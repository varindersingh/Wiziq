require 'wiziq/http_connection'
require 'wiziq/api_constants'
require 'wiziq/auth'

module Wiziq
	class Base
		include ApiConstants		
		attr_accessor :auth
			
		def call_api_method(api_method,api_params={})
			raise NoSuchAPIMethod, api_method  unless  API_METHODS.include? api_method
			api_response = api_request(api_method,api_params)
			api_response.body
		end 

		def api_request(api_method,api_params)
		    			
			url = "#{CLASS_API_ENDPOINT}/?method=#{api_method}"								

			@auth  ||= Wiziq::Auth.new(Wiziq.configuration.access_key, Wiziq.configuration.secret_key)

			auth_params = @auth.get_auth_params(api_method)
						
			api_params["signature"] = @auth.get_signature_digest

			request_params = api_params.merge(auth_params)
			Wiziq::HttpConnection.post(url,request_params,{ "User-Agent"=> USER_AGENT })
		end
	end
end
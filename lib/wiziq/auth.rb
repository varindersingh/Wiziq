require "cgi"
require "base64"
require "openssl"
require "digest/sha1"

module Wiziq
	class Auth
		attr_accessor :secret_key, :access_key, :timestamp, :method
		
		def initialize(access_key,secret_key)
			@secret_key = secret_key
			@access_key = access_key			
		end

		def get_signature_digest()			
			signature = Base64.encode64(OpenSSL::HMAC.digest('sha1', CGI::escape(@secret_key) , get_signature_base))
			signature.gsub(/\n/, "")
		end

		def get_auth_params(method)
			@timestamp = Time.now.to_i			
			@method = method
			{				
				"access_key" => @access_key,
				"timestamp" => @timestamp,
				"method" => method
			}
		end
	
		def get_signature_base()
			#params_hash.to_a.map { |k,v| "#{ k }=#{ v }"}.join("&")

			s="access_key=#{ @access_key }&timestamp=#{ @timestamp }&method=#{ @method }"
			puts "get_signature_base =  #{s.inspect}"
			s
		end
		
		
	end
end

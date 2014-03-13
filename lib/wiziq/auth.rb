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
			@timestamp = Time.now.to_i	
		end

		def get_signature_digest()			
			signature = Base64.encode64(OpenSSL::HMAC.digest('sha1', CGI::escape(@secret_key) , get_signature_base))
			signature.gsub(/\n/, "")
		end

		def get_auth_params(method)
					
			@method = method
			{				
				"access_key" => @access_key,
				"timestamp" => @timestamp,
				"method" => method
			}
		end
	
		def get_signature_base()
			 
			"access_key=#{ @access_key }&timestamp=#{ @timestamp }&method=#{ @method }"			
			
		end
	end
end

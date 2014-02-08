require 'faraday'

module Wiziq
	class HttpConnection
		class << self
			
			def post(url,params={},headers={})
				puts params.inspect
				connection = setup_request(headers)
				connection.post do |req|
					req.url url
					req.body = params
					puts params.inspect
				end
			end

			private
				def setup_request(headers={})

				  	connection = Faraday.new do |faraday|
					  faraday.request  :url_encoded             # form-encode POST params
					  faraday.response :logger                  # log requests to STDOUT
					  faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
					end
					
					connection.headers.merge! headers
					connection
				end
		end
	end
end

require "wiziq/configuration"
require "wiziq/api_client"


module Wiziq
	class << self
		attr_accessor :configuration
		def configure
			config = Wiziq::Configuration.new
			yield(config)
			self.configuration = config
		end

		def auto_config
			Wiziq.configure do |config|
				#access_key  = 5xXjqImdVXw=
				#secret_key  = 6LZxcvdgP6L9FlXz3mUYAg==
				config.secret_key = "23GQMUxQ/QMBiqYIWtogNg=="
				config.access_key = "eMmJoNlEPoY="
			end
			Wiziq::ApiClient.new
		end
		
	end

	class NoSuchAPIMethod < StandardError
	end

	class ApiError < StandardError
		attr_reader :code, :msg
		def initialize(code,msg)
			@code = code
			@msg = msg
		end
	end
end
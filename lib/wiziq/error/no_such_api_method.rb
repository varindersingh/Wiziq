require 'wiziq/error'


class NoSuchAPIMethod < Wiziq::Error
end

	class ApiError < StandardError
		attr_reader :code, :msg
		def initialize(code,msg)
			@code = code
			@msg = msg
		end
	end
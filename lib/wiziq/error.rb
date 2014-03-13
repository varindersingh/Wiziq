require 'nokogiri'

module Wiziq
	class Error < StandardError
		attr_reader :code, :message

		def initialize(response)

		end
		class << self

		end
	end
end
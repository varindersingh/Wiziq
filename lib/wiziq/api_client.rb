require 'wiziq/base'
require 'wiziq/response_parser'

module Wiziq
	class ApiClient < Wiziq::Base
		
		def to_hash(keys_array,node_set)
			map do |game|
  				keys_array.each_with_object({}) do |n, o|
    				o[n] = game.at(n).text
    			end
  			end
		end

		def get_data(options={})
			
			raise ArgumentError ,
					"expected Hash, got #{ options.class }" if options && !options.respond_to?(:to_hash)
							
			resp_xml = call_api_method(__method__.to_s,{ "page_size" => 2}.merge(options))
			parser = Wiziq::ResponseParser.new(resp_xml)
			parser.get_data_response
		end

		def modify

		end

		def cancel
			
		end

		def create(params)
			resp_xml = call_api_method(__method__.to_s,{ "page_size" => 2, "class_id" => 2142411})

		end

		def add_attedee

		end

		def get_attedance_report

		end

		#private


	end
end
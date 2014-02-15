require 'wiziq/api_types'
require 'nokogiri'

module Wiziq
	class ResponseParser
		attr_reader :xml, :doc
		
		def initialize(xml)
			@xml = xml
			@doc = Nokogiri::XML(xml)
			@response = {}
			if @doc.xpath('/rsp').attr('status').value == 'fail'
				
				error_node = @doc.xpath('/rsp/error')
				code = error_node.attr('code').value
				msg = error_node.attr('msg').value
				raise ApiError.new(code,msg) , error_node unless code == '1013'
			end
			@response[:method] = @doc.xpath('/rsp/method').inner_text
			method = @response[:method]
			@doc.xpath("//#{ method }/@*").each do |attribute|
				puts attribute.inspect
				@response[attribute.name.to_sym] = attribute.value
			end
		end

		def get_data_response

			@response[:get_data] = {}
			@response[:get_data][:record_list] = @doc.xpath("//record").collect do |record|

						record.element_children.each_with_object({}) do |attribute,h|
							h.merge!({ attribute.name.to_sym  => attribute.content })
						end
					end
			@response		
		end
		

		def create_response

			h = @doc.xpath("//create/class_details/*").each_with_object({}) do |node,h|

				h[node.name.to_sym] = node.content if  node.element_children.count == 0
				
				h[:presenter_list] = []

				@doc.xpath("//create/class_details/presenter_list/presenter").collect do |presenter|

					h[:presenter_list] << presenter.element_children.each_with_object({}) do |attribute,h|
							h.merge!({ attribute.name.to_sym  => attribute.content })
					end
				end
			end
		end

		def modify_response

		end

		def testm
			{}.methods
		end

	end
end
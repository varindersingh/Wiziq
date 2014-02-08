require "wiziq/version"

module Wiziq
	module ApiConstants	
		CLASS_API_ENDPOINT = 'http://class.api.wiziq.com'
		USER_AGENT = "Ruby client(wiziq-#{ VERSION }) for wiziq api. https://github.com/varindersingh/wiziq"
		API_METHODS = ['get_data','create','modify','cancel','add_attendees','download_recording']
	end
end
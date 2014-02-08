require 'date'
module Wiziq
	class Formatter
		self << class
			def time(str_time)
				!str_time.empty? ? DateTime.strptime(str_time ,"%m/%d/%Y %I:%M:%S %p") :
			end
		end
	end
end
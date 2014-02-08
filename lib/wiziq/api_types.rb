require 'date'
require 'tzinfo'

def parse_date(param)
	param[:start_time] = DateTime.strptime(param[:start_time], "%m/%d/%Y %I:%M:%S %p") if param.respond_to?(:key) && param.key?(:start_time)
	param
end

class Hash
	alias_method :old_merge!, :merge! 
	def merge!(other_hash)
		old_merge!( parse_date(other_hash))
	end
end
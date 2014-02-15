require 'date'
#require 'tzinfo'

def infer_type(param)
	if param.respond_to?(:key)
    	if param.key?(:start_time)
			param[:start_time] = DateTime.strptime(param[:start_time], "%m/%d/%Y %I:%M:%S %p") 
		elsif param.key?(:is_recurring)
			param[:is_recurring] = (param[:is_recurring] != "False")
		end			
	end
	param
end

class Hash
	alias_method :old_merge!, :merge!
	def merge!(other_hash)
		old_merge!(infer_type(other_hash))
	end
end
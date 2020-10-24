class Message < ApplicationRecord
	def fullname
    	"#{self.first_name} #{self.last_name}"
    end
end

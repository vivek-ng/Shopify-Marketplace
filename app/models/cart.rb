class Cart < ApplicationRecord
	has_many :orders
	
	def is_active?
		self.is_active
	end
end

class Cart < ApplicationRecord
	has_many :orders
	has_many :products , through: :orders
	def is_active?
		self.is_active
	end

	def set_active_status status = false
		self.is_active = status
		self.save
	end
end

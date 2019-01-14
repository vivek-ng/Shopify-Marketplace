class ApplicationController < ActionController::API

   def current_cart
   	if !Cart.last.nil? && Cart.last.is_active?
   		@current_cart = Cart.last
   	else
   		@current_cart = Cart.create(is_active: true)
   	end
   	@current_cart
   end

end

class CartsController < ApplicationController
	def add_products_to_cart
		@order = current_cart.orders.build(Product_id: params[:Product_id])
		@order.save
	end
end

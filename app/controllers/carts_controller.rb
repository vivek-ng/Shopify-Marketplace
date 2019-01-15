class CartsController < ApplicationController
	def add_products_to_cart
		@order = current_cart.orders.build(product_id: params[:product_id])
		@order.save
	end

	def complete_cart
        @purchasable_products = current_cart.products.where('inventory_count > ?' , 0)
        @purchasable_products.update_all("inventory_count = inventory_count-1")
        current_cart.set_active_status
        render json: { message: "All products with inventory > 0 have been purchased" ,
        products_purchased: @purchasable_products ,
        status: :ok }
	end

	def get_cart_details
		@all_products = current_cart.products
		byebug
		render json: {product_details: @all_products , Total: @all_products.sum('price') , status: :ok}
	end
end

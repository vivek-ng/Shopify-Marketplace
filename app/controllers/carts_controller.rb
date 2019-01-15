class CartsController < ApplicationController
    
    before_action :delete_cart_products_cache , only: [:complete_cart]

	def add_products_to_cart
		product_present = redis.sismember(redis_key , params[:product_id])
		if product_present
			message = "Product already Present in your cart!"
		else
		   @order = current_cart.orders.build(product_id: params[:product_id])
		   @order.save
           message = "Product successfully added to your cart!"
           redis.sadd(redis_key , params[:product_id])
	    end
	    render json: {message: message , status: :ok}
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
		render json: {product_details: @all_products , Total: @all_products.sum('price') , status: :ok}
	end
    
    private

    def redis
        $redis
    end

    def redis_key
    	"cart_products:#{current_cart.id}"
    end

    def delete_cart_products_cache
    	redis.del(redis_key)
    end

end

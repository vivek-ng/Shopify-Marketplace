class ProductsController < ApplicationController
   
   def all_product_details
   	@all_products = Product.all
   	@all_products = @all_products.select{|x| x.inventory_count > 0} if params["is_inventory"] == "true"
   	render json: @all_products , status: :ok
   end

end

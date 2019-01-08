class ProductsController < ApplicationController
   
   def all_product_details
   	@all_products = Product.all
   	render json: @all_products , status: :ok
   end

end

class ProductsController < ApplicationController
   
   def all_product_details
   	@all_products = Product.all
   	@all_products = @all_products.select{|x| x.inventory_count > 0} if params["is_inventory"] == "true"
   	render json: @all_products , status: :ok
   end

   def purchase_products
   	Product.where("id in (?) and inventory_count > ?" , JSON.parse(params[:ids]) , 0).find_each do |prod|
   		prod.update_attribute(:inventory_count , prod.inventory_count - 1)
   	end 
   end

end

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :products do
    	collection do
    		get 'all_product_details'
    		post 'purchase_products'
    	end
    end

    resources :carts do
    	collection do
    		post 'add_products_to_cart'
    		post 'complete_cart'
    		get 'get_cart_details'
        end
    end


end

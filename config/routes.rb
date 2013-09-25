UiDemo::Application.routes.draw do

  resources :products
  resources :product_categories do
    resources :products do
      get 'details' => 'products#details'
    end
  end

  root to: 'product_categories#index'
end

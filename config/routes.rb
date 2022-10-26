Rails.application.routes.draw do
  resources :tags do
		get '/recipes', to: 'tags#tag_recipes'
		collection do
			get :list
		end
  end

  resources :instructions
  resources :ingredients
  resources :recipes do
  	collection do
  		get :my_recipes
  	end
  end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

	root 'recipes#index'
end

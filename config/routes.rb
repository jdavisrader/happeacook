Rails.application.routes.draw do
  resources :instructions
  resources :ingredients
  resources :recipes
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

	root 'recipes#index'
end

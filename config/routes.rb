Rails.application.routes.draw do
  devise_for :users
  get 'default_categories', to: 'categories#default_categories'
  resources :categories
  get 'default_links', to: 'links#default_links'
  resources :links, except: :index
  root 'categories#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

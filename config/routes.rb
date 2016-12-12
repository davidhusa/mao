Rails.application.routes.draw do
  resources :grid_cells
  resources :grid_rows
  resources :list_items
  resources :card_types
  resources :cards
  devise_for :users
  resources :comments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to:"cards#index"
end

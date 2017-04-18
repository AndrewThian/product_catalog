Rails.application.routes.draw do

  root to: 'static#homepage'

  resources :products
  resources :sub_sub_categories
  resources :sub_categories
  resources :categories
end

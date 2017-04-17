Rails.application.routes.draw do
  resources :products

  resources :sub_sub_categories

  resources :sub_categories

  resources :categories

  root to: 'static#homepage'
end

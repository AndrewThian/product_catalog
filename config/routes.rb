Rails.application.routes.draw do

  namespace :admin do
    resources :categories
    resources :products
    resources :sub_categories
    resources :sub_sub_categories

    root to: "categories#index"
  end

  resources :products

  resources :sub_sub_categories

  resources :sub_categories

  resources :categories

  root to: 'static#homepage'
end

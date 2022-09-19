Rails.application.routes.draw do

  devise_for :admins
  devise_for :customers

  namespace :public do
   resources :shipping_addresses, only: [:index, :edit, :create, :update, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end

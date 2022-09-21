Rails.application.routes.draw do
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
  }

  scope module: :public do
    root to: 'homes#top'
    get "home/about" => "homes#about", as: "about"
    get "customers/my_page" => "customers#show"
    
    resources :items

    resources :customers
    resources :cart_items do
      collection do
        delete 'destroy_all'
      end
    end

    resources :orders
    resources :shipping_addresses, only: [:index, :edit, :create, :update, :destroy]
  end

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }


  namespace :admin do
    root to: 'homes#top'
    resources :items
    resources :genres
    resources :customers
    resources :orders
    resources :order_details
  end

end

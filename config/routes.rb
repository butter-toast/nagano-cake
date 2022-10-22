Rails.application.routes.draw do
  namespace :admin do
    get 'homes/top'
  end
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }


  scope module: :public do
    root to: "homes#top"
    get "about" => "homes#about", as: :about

    resources :products
    resources :shippings
    resources :cart_items,only: [:index, :create, :update, :destroy]
    resources :customers do
      member do
        get :unsubscribe
        patch :withdraw
      end

    end
    resources :orders do
      collection do
        post :log
        get :complete
      end
    end
  end

  namespace :admin do
    resources :products
    resources :productions
    resources :genres
    resources :customers
    resources :orders
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

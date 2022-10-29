Rails.application.routes.draw do

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
    resources :genres,only: [:show]
    resources :shippings
    resources :cart_items,only: [:index, :create, :update, :destroy, :destroy_all] do
      collection do
        delete 'destroy_all'
      end
    end

    get 'my_page' => 'customers#show', as: 'my_page'
    get 'information/edit' => 'customers#edit'
    patch 'information' => 'customers#update'
    get 'unsubscribe' => 'customers#unsubscribe'
    patch 'withdraw' => 'customers#withdraw'

    resources :orders do
      collection do
        post :log
        get :complete
      end
    end
  end

  get "admin" => "admin/homes#top", as: :admin
  namespace :admin do
    resources :products
    resources :productions
    resources :genres
    resources :customers
    resources :orders
    get 'customers/:id/orders' => 'customers#history', as: 'customer_orders'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

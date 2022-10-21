Rails.application.routes.draw do
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  # devise_for :adminsからadminに変更
  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  # public/の追加
  root to: "public/homes#top"
  get "home/about" => "homes#about" , as: "about"

  resources :products
  resources :shippings
  resources :cart_items
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


  namespace :admin do
    resources :products
    resources :productions
    resources :genres
    resources :customers
    resources :orders
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

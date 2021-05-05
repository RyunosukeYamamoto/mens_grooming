Rails.application.routes.draw do
  root to: 'toppages#skin'
  
  get 'make', to: 'toppages#make'
  get 'hair', to: 'toppages#hair'
  get 'others', to: 'toppages#others'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :troubles, only: [:create]
  resources :users, only: [:index, :show, :create] do
    member do
      get :favorite
    end
  end
  resources :posts, except: [:index, :edit, :update] do
    collection do
      get :search_from_trouble
    end
  end
  resources :relationships, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]
end

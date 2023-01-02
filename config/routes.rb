Rails.application.routes.draw do
  get 'users/show'
  get 'users/delete'
  get 'users/update'
  get 'static_pages/help'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root 'static_pages#home'\
  devise_for :users

  devise_scope :user do
    authenticated do
      root to: "albums#index", as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
    
    resources :albums do
      resources :photos
    end
  end

  
end

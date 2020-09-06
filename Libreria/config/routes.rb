Rails.application.routes.draw do
  
  resources :books do
    member do
      get :delete
    end
  end

  resources :authors do
    member do
      get :delete
    end
  end

  root 'authors#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

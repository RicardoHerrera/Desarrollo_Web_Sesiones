Rails.application.routes.draw do
  
  resources :books do
    member do
      get :delete
    end
  end

  get 'authors/index'
  get 'authors/show'
  get 'authors/new'
  get 'authors/edit'
  get 'authors/delete'

  root 'books#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

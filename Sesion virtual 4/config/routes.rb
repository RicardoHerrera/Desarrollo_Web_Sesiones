Rails.application.routes.draw do
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # get 'about', controller: :static, action: :about, alias: 'about'

  root 'home#index'
end

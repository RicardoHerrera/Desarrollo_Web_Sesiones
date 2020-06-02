Rails.application.routes.draw do
  get 'about', controller: :static, action: :about, alias: 'about'
  # same as get 'static/about'
  get 'faq', to: 'static#faq', as: 'faq'
  # same as get 'static/faq'  
  get 'services', to: 'static#services', as: 'services'
  # same as get 'static/services'
  get 'home/index'
  # post 'home/formulario_post'
  post 'services', to: 'static#services', as: 'feedback'
  # post 'contact', to: 'home#formulario_post', as: 'formulario_post'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'home#index'
end
 
Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root :to => 'books#index'
  root "books#home"
  resources:books, except: [:new]
end

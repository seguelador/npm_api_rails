Rails.application.routes.draw do
  resources :contributors
  resources :maintainers
  resources :repositories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

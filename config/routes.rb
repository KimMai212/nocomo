Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :projects, only: %i[index show] do
    resources :layouts, only: :create
  end
  get '/generate', to: 'projects#new'
end

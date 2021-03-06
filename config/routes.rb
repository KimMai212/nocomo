Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :projects, only: %i[create update]
  get "/generate", to: "projects#new"
  get "/generate/:project_id/preview", to: "projects#preview", as: "preview"
  get "/dashboard", to: "dashboards#index"
  get "/generate/:project_id/jpg", to: "projects#jpg", as: "jpg"
  post "/generatepdf", to: "projects#generate"

end

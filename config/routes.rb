Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :job_positions
  resources :applicants

  root to: "job_positions#index"
end

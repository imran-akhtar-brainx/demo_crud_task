Rails.application.routes.draw do
  root "hiring_positions#index"

  resources :hiring_positions do
    resources :candidates
  end
end

Rails.application.routes.draw do
  apipie
  resources :projects do
    resources :tasks
  end
end

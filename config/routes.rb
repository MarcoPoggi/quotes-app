Rails.application.routes.draw do
  devise_for :users, path: "accounts"

  root to: "pages#home"
  resources :quotes
end

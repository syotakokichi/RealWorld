Rails.application.routes.draw do
  namespace :api do
    resources :articles, only: [:create, :show, :update, :destroy]
  end
end
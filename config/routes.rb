Rails.application.routes.draw do
  root 'pages#home'

  resources :halls, only: [:show] do
    resources :tables, only: [:create, :show, :destroy] do
      put :book
      put :release
    end
  end
end

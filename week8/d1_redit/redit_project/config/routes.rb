Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :index] do
    resources :subs, only: [:create]
  end

  resources :subs, only: [:edit, :update, :new, :show, :index]
end

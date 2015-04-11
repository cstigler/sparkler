Rails.application.routes.draw do
  root 'feeds#index'

  resources :feeds do
    resources :statistics

    get :reload, on: :member
  end

  resource :user, controller: 'user', only: [:edit, :update] do
    member do
      get :login_form, :logout
      post :login
    end
  end
end

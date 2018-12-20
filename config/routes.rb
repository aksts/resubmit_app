Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  get 'posts/show'
  resources :posts do
    member do
      get :detail
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

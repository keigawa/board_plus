Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :my_threads do
    scope module: :my_threads do
      resources :comments
    end
  end
  root to: "my_threads#index"
  devise_for :users
end

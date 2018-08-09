Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  resources :images
  resources :posts
  root to: "home#index"
  
  namespace 'api' do
    namespace 'v1' do
      post 'auth_user' => 'authentication#authenticate_user'
      post "sign_up" => 'registration#create'
      resources :images
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Rails.application.routes.draw do
  devise_for :users, :controllers => {
  :registrations => 'users/registrations',
  :sessions => 'users/sessions'   
} 

devise_scope :user do
  get "user/:id", :to => "users/registrations#detail"
  get "signup", :to => "users/registrations#new"
  get "login", :to => "users/sessions#new"
  delete "logout", :to => "users/sessions#destroy"
end
  root to: "articles#index"
  resources :articles do
    post :confirm, action: :confirm_new, on: :new
  end
end

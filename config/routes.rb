Rails.application.routes.draw do
  resources :maneys
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords',
    :unlocks => 'users/unlocks',
  }

  devise_scope :user do
    root :to => "web#index"
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    delete "logout", :to => "users/sessions#destroy"
  end
  resources :salaries
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

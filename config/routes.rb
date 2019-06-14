Rails.application.routes.draw do
  devise_for :groups
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  resources :manages do 
    collection do
      get :calculate
      get :result
      get :odds
    end
  end

  resources :questions
  resources :questions
  resources :scores

  root 'homes#index'
end

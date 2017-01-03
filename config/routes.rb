Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'placements#index'
  resources :users, only: [:create] do
    collection do
      get 'sign_in', to: 'sessions#new'
      post 'sign_in', to: 'sessions#create'
      get 'sign_out', to: 'sessions#destroy'
      get 'sign_up', to: 'users#new'
    end
  end
end

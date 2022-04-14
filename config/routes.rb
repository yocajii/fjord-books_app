Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  root to: 'books#index'
  resources :books
  resources :users, only: %i[index show edit update] do
    member do
      get :followings, :followers
    end
    resource :following_relations, only: %i[create destroy]
  end
end

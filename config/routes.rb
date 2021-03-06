# frozen_string_literal: true

Rails.application.routes.draw do
  get 'comments/create'
  get 'likes/create'
  get 'likes/destroy'
  get 'like/create'
  get 'like/destroy'
  get 'password_resets/new'
  get 'password_resets/edit'
  get 'sessions/new'
  root 'static_pages#home'

  get 'users/new'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :account_activations, only: [:edit]
  resources :password_resets, only: %i[new create edit update]
  resources :microposts,          only: [:create, :show, :destroy]
  resources :relationships,       only: [:create, :destroy]
  resources :likes, only: %i[create destroy]
  resources :comments, only: [:create]

  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end

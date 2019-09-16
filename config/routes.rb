# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'
  resources :courses, only: [:index, :show] do
    resources :enrollments, only: :create
  end
  resources :lessons, only: [:show]
  namespace :instructor do
    resources :lessons, only: [:update]
    resources :sections, only: [] do
      resources :lessons, only: [:new, :create, :destroy, :edit]
    end
    resources :courses, only: [:new, :create, :show, :destroy, :edit] do
      resources :sections, only: [:new, :create, :destroy, :edit]
    end
  end
end

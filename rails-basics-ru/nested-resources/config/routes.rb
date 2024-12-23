# frozen_string_literal: true

Rails.application.routes.draw do
  resources :comments
  root 'homes#index'

  # BEGIN
  resources :posts do
    resources :comments, module: :posts
  end
  # END
end

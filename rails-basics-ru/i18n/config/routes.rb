# frozen_string_literal: true

Rails.application.routes.draw do
  # BEGIN
  scope ':locale', locale: /#{I18n.available_locales.join('|')}/ do
    root 'home#index'
    resources :posts
  end
  # END

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
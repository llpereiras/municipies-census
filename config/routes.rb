# frozen_string_literal: true

Rails.application.routes.draw do
  root 'municipies#index'

  resources :municipies, except: %i[destroy show] do
    member do
      post :inactive
    end
  end
end

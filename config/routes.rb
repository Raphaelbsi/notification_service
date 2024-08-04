Rails.application.routes.draw do
  resources :notifications, only: %i[index create]
end

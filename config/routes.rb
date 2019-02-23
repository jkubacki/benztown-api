# frozen_string_literal: true

Rails.application.routes.draw do
  use_doorkeeper
  devise_for :mplcs, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

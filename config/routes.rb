# frozen_string_literal: true

Rails.application.routes.draw do
  # ActiveAdmin
  devise_for :mplcs, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # API
  use_doorkeeper
  mount API::Core, at: "/"
end

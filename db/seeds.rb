# frozen_string_literal: true

if Rails.env.development?
  Mplc.create!(email: "admin@example.com", password: "password", password_confirmation: "password")
end

# frozen_string_literal: true

FactoryBot.define do
  factory :mplc do
    sequence :email do |n|
      "#{n}-#{Faker::Internet.email}"
    end
    password { Faker::Internet.password(8) }
  end
end

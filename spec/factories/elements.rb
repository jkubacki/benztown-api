# frozen_string_literal: true

FactoryBot.define do
  factory :element do
    name { "name" }
    file { fixture_file_upload(Rails.root.join("spec", "support", "assets", "test.mp3")) }

    trait :with_mp3_file do
      file { fixture_file_upload(Rails.root.join("spec", "support", "assets", "test.mp3")) }
    end

    trait :with_wav_file do
      file { fixture_file_upload(Rails.root.join("spec", "support", "assets", "test.wav")) }
    end
  end
end

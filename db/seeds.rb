# frozen_string_literal: true

Mplc.create!(
  email: Rails.application.credentials.mplc[:email],
  password: Rails.application.credentials.mplc[:password],
  password_confirmation: Rails.application.credentials.mplc[:password]
)

if Rails.env.development?
  tags = ["jingle", "libraries", "voice-over", "imaging", "programming"]

  10.times do |i|
    element = Element.new(name: Faker::Music::Phish.song)
    element.file.attach(io: File.open("spec/support/assets/test.mp3"), filename: "element#{i + 1}.mp3")
    element.tag_list.add(tags.sample(rand(4)))
    element.save
  end
end

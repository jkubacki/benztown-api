# frozen_string_literal: true

require "rails_helper"

RSpec.describe Clients::Invite do
  subject { described_class.call(email: email) }

  context "when email is not valid" do
    let(:email) { "notvalid" }

    it "returns failure with invalid client" do
      expect(subject.failure.errors.messages).to eq(email: ["is invalid"])
    end
  end

  context "when email is valid" do
    let(:email) { "user@example.com" }

    it "returns success with invited client" do
      expect(subject.value!.email).to eq email
    end
  end
end

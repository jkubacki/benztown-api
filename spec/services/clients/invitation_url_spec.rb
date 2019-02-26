# frozen_string_literal: true

require "rails_helper"

RSpec.describe Clients::InvitationUrl do
  subject { described_class.call(client: client) }

  let(:client) { build_stubbed(:client, invitation_token: invitation_token) }

  context "when invitation token is empty" do
    let(:invitation_token) { nil }

    it { is_expected.to be_failure }
  end

  context "when invitation token is not empty" do
    let(:invitation_token) { "invitation_token" }

    it "returns success with confirmation url" do
      expect(subject.value!).to eq(
        "http://frontendhost.com/accept-invitation?invitation_token=invitation_token"
      )
    end
  end
end

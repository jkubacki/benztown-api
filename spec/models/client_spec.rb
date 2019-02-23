# frozen_string_literal: true

require "rails_helper"

RSpec.describe Client do
  describe "#accepted_invitation?" do
    subject { client.accepted_invitation? }

    let(:client) { build_stubbed(:client, invitation_accepted_at: invitation_accepted_at) }

    context "when client doesn't have invitation_accepted_at" do
      let(:invitation_accepted_at) { nil }

      it { is_expected.to eq false }
    end

    context "when client has invitation_accepted_at" do
      let(:invitation_accepted_at) { Time.now }

      it { is_expected.to eq true }
    end
  end
end

# frozen_string_literal: true

require "rails_helper"

RSpec.describe Clients::AcceptInvitation do
  subject { described_class.call(invitation_token: invitation_token, password: password) }

  let(:password) { "password" }

  let(:invitation_token) { "26748bc732e1db643ae39a800cb90d6b3ae162c0c6ebb5c6335d5f13b0e44298" }

  context "when there is no client with passed invitation token" do
    it "returns failure with Invitation token is not valid value" do
      expect(subject.failure).to eq "Invitation token is not valid"
    end
  end

  context "when there is client with passed invitation token" do
    let!(:client) { create(:client, invitation_token: invitation_token) }

    context "when accepting is successfull" do
      it { is_expected.to be_success }

      it "updates client password" do
        subject
        expect(client.reload.valid_password?("password")).to eq true
      end

      context "when password is too short" do
        let(:password) { "psw" }

        it "returns failure with validation full message" do
          expect(subject.failure).to eq "Password is too short (minimum is 6 characters)"
        end
      end
    end

    context "when accepting returns false" do
      before do
        # rubocop:disable RSpec/AnyInstance
        allow_any_instance_of(Client).to receive(:accept_invitation!).and_return(false)
        # rubocop:enable RSpec/AnyInstance
      end

      it "returns failure with Failed to accept invitation" do
        expect(subject.failure).to eq "Failed to accept invitation. It might be expired."
      end
    end
  end
end

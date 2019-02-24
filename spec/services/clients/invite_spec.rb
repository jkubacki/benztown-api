# frozen_string_literal: true

require "rails_helper"

RSpec.describe Clients::Invite do
  include Dry::Monads::Result::Mixin

  subject { described_class.call(email: email, mplc: mplc) }

  let(:mplc) { build(:mplc) }

  context "when email is not valid" do
    let(:email) { "notvalid" }

    it "returns failure with invalid client" do
      expect(subject.failure.errors.messages).to eq(email: ["is invalid"])
    end
  end

  context "when email is valid" do
    let(:email) { "user@example.com" }
    let(:invite_mailer) { instance_double(ActionMailer::MessageDelivery, deliver_now: nil) }

    before do
      allow(Clients::InvitationUrl).to receive(:call).and_return(invitation_url_result)
      allow(InvitationMailer).to receive(:invite).and_return(invite_mailer)
    end

    context "when generating invitation url is a failure" do
      let(:invitation_url_result) { Failure(nil) }

      it { is_expected.to be_failure }

      it "doesn't create new user" do
        expect { subject }.not_to change(Client, :count)
      end
    end

    context "when generating invitation url is a success" do
      let(:invitation_url) { "http://example.com?invitation_token=token" }
      let(:invitation_url_result) { Success(invitation_url) }

      it { is_expected.to be_success }

      it "creates a new user" do
        expect { subject }.to change(Client, :count).by(1)
      end

      it "returns success with invited client" do
        expect(subject.value!.email).to eq email
      end

      it "sends invitation email" do
        expect(InvitationMailer).to(
          receive(:invite).with(anything, mplc.id, invitation_url)
        ).once
        expect(invite_mailer).to receive(:deliver_now).once
        subject
      end
    end
  end
end

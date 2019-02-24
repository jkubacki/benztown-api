# frozen_string_literal: true

require "rails_helper"

RSpec.describe InvitationMailer, type: :mailer do
  describe "invite" do
    let(:mail) { InvitationMailer.invite(client.id, mplc.id, invitation_url) }

    let(:client) { create(:client, email: "client@example.com") }
    let(:mplc) { create(:mplc, email: "mplc@example.com") }
    let(:invitation_url) { "http://example.com?invitation_token=invitation_token" }

    it "renders the headers" do
      expect(mail.subject).to eq("mplc@example.com would like to share his library with you")
      expect(mail.to).to eq(["client@example.com"])
    end

    it "renders the body with the invitation url" do
      expect(mail.body.encoded).to include(invitation_url)
    end
  end
end

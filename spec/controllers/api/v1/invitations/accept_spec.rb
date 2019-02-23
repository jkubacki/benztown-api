# frozen_string_literal: true

require "rails_helper"

describe API::V1::Invitations::Accept, type: :request do
  include Dry::Monads::Result::Mixin

  subject { put "/api/v1/invitations", headers: headers, params: params }

  let(:params) do
    {
      "invitation_token" => "invitation_token",
      "password" => "password"
    }
  end

  include_context "when not authenticated"

  before do
    allow(Clients::AcceptInvitation).to(
      receive(:call).with(invitation_token: "invitation_token", password: "password")
      .and_return(accept_invitation_result)
    )
  end

  context "when accept invitation fails" do
    let(:accept_invitation_result) { Failure(nil) }

    it "returns 422 status" do
      subject
      expect(response.code).to eq "422"
    end
  end

  context "when accept invitation succeeds" do
    let(:accept_invitation_result) { Success(nil) }

    it "returns 204 status" do
      subject
      expect(response.code).to eq "204"
    end
  end
end

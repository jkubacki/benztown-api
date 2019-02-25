# frozen_string_literal: true

require "rails_helper"

describe API::V1::Invitations::Accept, type: :request do
  include Dry::Monads::Result::Mixin

  subject { post "/api/v1/invitations", headers: headers, params: params }

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
    let(:accept_invitation_result) { Failure("Failure reason") }

    it "returns 422 status with failure reason" do
      subject
      expect(response.code).to eq "422"
      expect(response.body).to include "Failure reason"
    end
  end

  context "when accept invitation succeeds" do
    let(:accept_invitation_result) { Success(nil) }

    it "returns 204 status with empty body" do
      subject
      expect(response.code).to eq "204"
      expect(response.body).to be_empty
    end
  end
end

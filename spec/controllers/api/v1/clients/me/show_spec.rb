# frozen_string_literal: true

require "rails_helper"

describe API::V1::Clients::Me::Show, type: :request do
  subject { get "/api/v1/clients/me", headers: headers }

  context "when not authenticated" do
    include_context "when not authenticated"

    it "returns 401 status" do
      subject
      expect(response.code).to eq "401"
    end
  end

  context "when authenticated" do
    include_context "when authenticated"

    it "renders current client" do
      subject
      response_body = JSON.parse(response.body)
      expect(response_body["data"]["type"]).to eq "client"
      expect(response_body["data"]["id"]).to eq client.id.to_s
    end
  end
end

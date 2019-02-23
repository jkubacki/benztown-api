# frozen_string_literal: true

require "rails_helper"

describe API::V1::Elements::Index, type: :request do
  subject { get "/api/v1/elements", headers: headers }

  context "when not authenticated" do
    include_context "when not authenticated"

    it "returns 401 status" do
      subject
      expect(response.code).to eq "401"
    end
  end

  context "when authenticated" do
    include_context "when authenticated"

    let!(:element1) { create(:element) }
    let!(:element2) { create(:element) }

    # Controller test with creating records are expensive.
    # That's why I'm using multiple expects to validate response data in one example.
    it "renders array of elements" do
      subject
      response_data = JSON.parse(response.body)["data"]
      expect(response_data.size).to eq 2

      element1_data = response_data.first
      expect(element1_data["type"]).to eq "element"
      expect(element1_data["id"]).to eq element1.id.to_s

      element2_data = response_data.second
      expect(element2_data["type"]).to eq "element"
      expect(element2_data["id"]).to eq element2.id.to_s
    end
  end
end

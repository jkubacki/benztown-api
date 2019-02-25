# frozen_string_literal: true

require "rails_helper"

describe API::V1::Elements::Index, type: :request do
  subject { get "/api/v1/elements", headers: headers, params: params }

  let(:params) { {} }

  context "when not authenticated" do
    include_context "when not authenticated"

    it "returns 401 status" do
      subject
      expect(response.code).to eq "401"
    end
  end

  context "when authenticated" do
    include_context "when authenticated"

    let!(:d12) { create(:element, name: "d12 crew") }
    let!(:eminem) { create(:element, name: "eminem") }

    context "when no search query is passed" do
      # Controller test with creating records are expensive.
      # That's why I'm using multiple expects to validate response data in one example.
      it "renders array of elements" do
        subject
        response_data = JSON.parse(response.body)["data"]
        expect(response_data.size).to eq 2

        d12_data = response_data.first
        expect(d12_data["type"]).to eq "element"
        expect(d12_data["id"]).to eq d12.id.to_s

        eminem_data = response_data.second
        expect(eminem_data["type"]).to eq "element"
        expect(eminem_data["id"]).to eq eminem.id.to_s
      end
    end

    context "when search query is passed" do
      let(:params) { { q: "d12" } }

      let!(:mozart) { create(:element, name: "mozart") }

      before do
        eminem.tag_list.add("member of d12")
        eminem.save
        Element.reindex
      end

      it "renders only elements with search query in name or tags" do
        subject
        response_data = JSON.parse(response.body)["data"]
        expect(response_data.size).to eq 2

        ids = response_data.map { |data| data["id"]  }
        expect(ids).to include(d12.id.to_s)
        expect(ids).to include(eminem.id.to_s)
        expect(ids).to_not include(mozart.id.to_s)
      end
    end
  end
end

# frozen_string_literal: true

require "rails_helper"

RSpec.describe Admin::ClientsController, type: :controller do
  include Dry::Monads::Result::Mixin

  let!(:mplc) { create(:mplc) }

  before { sign_in mplc }

  describe "POST create" do
    subject { post :create, params: { client: { email: "user@example.com" } } }

    before do
      allow(Clients::Invite).to receive(:call).and_return(invite_result)
    end

    let(:result_client) { build_stubbed(:client, email: "resultclient@client.com") }

    context "when invite is a failure" do
      let(:invite_result) { Failure(result_client) }

      it "assigns result client as @client" do
        subject
        expect(assigns(:client)).to eq result_client
      end

      it "renders edit template" do
        expect(subject).to render_template(:edit)
      end
    end

    context "when invite is successfull" do
      let(:invite_result) { Success(result_client) }

      it "redirects to index page with notice with user email" do
        subject
        expect(response).to redirect_to(admin_clients_path)
        expect(flash[:notice]).to eq "User resultclient@client.com invited"
      end
    end
  end
end

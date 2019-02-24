# frozen_string_literal: true

module Clients
  class Invite < ApplicationService
    def call(email:, mplc:)
      ActiveRecord::Base.transaction do
        yield invite_result = invite_client(email)
        client = invite_result.value!
        yield url_result = generate_invitation_url(client)
        send_email(client.id, mplc.id, url_result.value!)
        Success(client)
      end
    end

    private

    def invite_client(email)
      client = Client.invite!(email: email, skip_invitation: true)
      client.persisted? ? Success(client) : Failure(client)
    end

    def generate_invitation_url(client)
      Clients::InvitationUrl.call(client: client)
    end

    def send_email(client_id, mplc_id, invitation_url)
      # FIXME, Use deliver_later after implementing background jobs
      InvitationMailer.invite(client_id, mplc_id, invitation_url).deliver_now
    end
  end
end

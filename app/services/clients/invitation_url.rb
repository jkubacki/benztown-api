# frozen_string_literal: true

module Clients
  class InvitationUrl < ApplicationService
    def call(client:)
      return Failure(:no_invitation_token) if client.invitation_token.blank?

      token = build_url(client.invitation_token)
      Success(token)
    end

    private

    def build_url(invitation_token)
      "#{Rails.application.credentials.frontend_host}/accept-invitation?" \
      "invitation_token=#{invitation_token}"
    end
  end
end

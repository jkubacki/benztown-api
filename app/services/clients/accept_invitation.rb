# frozen_string_literal: true

module Clients
  class AcceptInvitation < ApplicationService
    def call(invitation_token:, password:)
      yield find_result = find_client(invitation_token)
      client = find_result.value!
      client.password = password
      accept_invitation(client)
    end

    private

    def find_client(invitation_token)
      client = Client.find_by(invitation_token: invitation_token)
      client.present? ? Success(client) : Failure(nil)
    end

    def accept_invitation(client)
      result = client.accept_invitation!
      result ? Success(nil) : Failure(nil)
    end
  end
end

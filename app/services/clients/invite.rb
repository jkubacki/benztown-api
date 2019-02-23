# frozen_string_literal: true

module Clients
  class Invite < ApplicationService
    def call(email:)
      client = Client.invite!(email: email, skip_invitation: true)
      client.persisted? ? Success(client) : Failure(client)
    end
  end
end

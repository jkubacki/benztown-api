# frozen_string_literal: true

require "doorkeeper/grape/helpers"

# Helpers for API authentication
module API
  module AuthHelper
    extend ::Grape::API::Helpers
    include Doorkeeper::Grape::Helpers

    APPLICATION = "application"

    # JSON unauthorized response on unauthenticated client
    def authenticate_client!
      unauthorized_error unless authenticated?
    end

    # Check if client is authenticated by doorkeeper token
    def authenticated?
      doorkeeper_token.present? ? doorkeeper_authorize!.nil? : false
    end

    # Unathorized error json response
    def unauthorized_error
      error!("401 Unauthorized", 401)
    end

    # Current client
    def current_client
      return nil unless authenticated?

      doorkeeper_client
    end

    # Client from doorkeeper token or new client
    def doorkeeper_client
      doorkeeper_token.resource_owner_id ? Client.find(doorkeeper_token.resource_owner_id) : Client.new
    end

    # Verifies JSON API requrest header
    def check_accept_header!
      return if request.headers["Accept"] == "application/vnd.api+json"

      return_error!(415, message: "Unsupported Media Type")
    end
  end
end

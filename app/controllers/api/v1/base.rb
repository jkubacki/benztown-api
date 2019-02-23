# frozen_string_literal: true

module API
  module V1
    # Base API configuration for V1, JSON API
    class Base < Core
      before { check_accept_header! }

      version "v1", using: :path, vendor: "benztown"
      format :json
      content_type :json, "application/vnd.api+json"

      mount Clients::Base
    end
  end
end

# frozen_string_literal: true

module API
  # Core API configuration for all future versions
  class Core < Grape::API
    prefix :api
    helpers AuthHelper

    mount API::V1::Base
  end
end

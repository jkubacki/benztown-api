# frozen_string_literal: true

module API
  module V1
    module Clients
      class Base < Base
        resource :clients do
          before { authenticate_client! }

          namespace :me do
            mount Clients::Me::Show
          end
        end
      end
    end
  end
end

# frozen_string_literal: true

module API
  module V1
    module Clients
      module Me
        class Show < Base
          desc "Return the logged in client"
          get do
            current_client
          end
        end
      end
    end
  end
end

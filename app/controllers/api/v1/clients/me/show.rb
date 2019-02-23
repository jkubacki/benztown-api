# frozen_string_literal: true

module API
  module V1
    module Clients
      module Me
        class Show < Base
          desc "Return the logged in client"
          get do
            ClientSerializer.new(current_client).serializable_hash
          end
        end
      end
    end
  end
end

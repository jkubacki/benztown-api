# frozen_string_literal: true

module API
  module V1
    module Invitations
      class Base < Base
        resource :invitations do
          mount Invitations::Accept
        end
      end
    end
  end
end

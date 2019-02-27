# frozen_string_literal: true

module API
  module V1
    module Invitations
      class Accept < Base
        params do
          requires :invitation_token, type: String
          requires :password, type: String
        end

        post do
          result =
            ::Clients::AcceptInvitation.call(
              invitation_token: params[:invitation_token],
              password: params[:password]
            )
          if result.success?
            status 204
            nil
          else
            status 422
            result.failure
          end
        end
      end
    end
  end
end

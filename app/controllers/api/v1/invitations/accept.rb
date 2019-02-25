# frozen_string_literal: true

module API
  module V1
    module Invitations
      class Accept < Base
        post do
          result =
            ::Clients::AcceptInvitation.call(
              invitation_token: params[:invitation_token],
              password: params[:password]
            )
          status result.success? ? 204 : 422
          nil
        end
      end
    end
  end
end

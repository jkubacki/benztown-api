# frozen_string_literal: true

module API
  module V1
    module Elements
      class Base < Base
        resource :elements do
          before { authenticate_client! }

          mount Index
        end
      end
    end
  end
end

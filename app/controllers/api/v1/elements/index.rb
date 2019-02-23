# frozen_string_literal: true

module API
  module V1
    module Elements
      class Index < Base
        get do
          elements = Element.all
          ElementSerializer.new(elements).serializable_hash
        end
      end
    end
  end
end

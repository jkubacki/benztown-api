# frozen_string_literal: true

module API
  module V1
    module Elements
      class Index < Base
        get do
          q = params[:q]
          elements = q.present? ? Element.search(q) : Element.all
          ElementSerializer.new(elements).serializable_hash
        end
      end
    end
  end
end

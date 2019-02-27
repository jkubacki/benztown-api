# frozen_string_literal: true

module API
  module V1
    module Elements
      class Index < Base
        params do
          optional :q, type: String
        end

        get do
          q = params[:q]
          elements =
            if q.present?
              ids =  Element.search(q).results.map(&:id)
              Element.where(id: ids)
            else
              Element.all
            end
          ElementSerializer.new(
            elements.includes(tags: :taggings, file_attachment: :blob)
          ).serializable_hash
        end
      end
    end
  end
end

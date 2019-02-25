# frozen_string_literal: true

class ElementSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :tag_list

  attribute :file do |element|
    Rails.application.routes.url_helpers.polymorphic_url(element.file)
  end
end

# frozen_string_literal: true

class ElementSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :tag_list

  attribute :file do |element|
    Rails.application.routes.url_helpers.rails_blob_path(element.file, only_path: true)
  end
end

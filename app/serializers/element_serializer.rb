# frozen_string_literal: true

class ElementSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :tag_list, :file
end

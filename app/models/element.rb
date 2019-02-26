# frozen_string_literal: true

class Element < ApplicationRecord
  ALLOWED_CONTENT_TYPES = %w[audio/mpeg].freeze
  private_constant :ALLOWED_CONTENT_TYPES

  acts_as_taggable

  has_one_attached :file

  validates :name, presence: true
  validates :file, presence: true, blob: { content_type: ALLOWED_CONTENT_TYPES }

  searchkick(
    callbacks: :async,
    word_middle: %i[name tags]
  )
end

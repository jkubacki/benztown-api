# frozen_string_literal: true

class Element < ApplicationRecord
  ALLOWED_CONTENT_TYPES = %w[audio/mpeg].freeze
  private_constant :ALLOWED_CONTENT_TYPES

  acts_as_taggable

  has_one_attached :file

  has_one(
    :file_attachment,
    -> { where(name: 'file') },
    class_name: "ActiveStorage::Attachment",
    as: :record, inverse_of: :record, dependent: false
  )
  has_one :file_blob, through: :file_attachment, class_name: "ActiveStorage::Blob", source: :blob

  validates :name, presence: true
  validates :file, presence: true, blob: { content_type: ALLOWED_CONTENT_TYPES }

  searchkick(
    callbacks: :async,
    word_middle: %i[name tags]
  )
end

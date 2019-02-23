# frozen_string_literal: true

class Element < ApplicationRecord
  has_one_attached :file

  validates :name, presence: true
end

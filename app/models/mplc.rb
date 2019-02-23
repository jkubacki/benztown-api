# frozen_string_literal: true

class Mplc < ApplicationRecord
  devise :database_authenticatable, :rememberable, :validatable
end

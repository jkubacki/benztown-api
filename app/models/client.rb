# frozen_string_literal: true

class Client < ApplicationRecord
  devise :database_authenticatable, :rememberable, :validatable, :invitable

  def accepted_invitation?
    invitation_accepted_at.present?
  end
end

# frozen_string_literal: true

class InvitationMailer < ApplicationMailer
  layout "mailer"

  def invite(client_id, mplc_id, invitation_url)
    @client = Client.find(client_id)
    @mplc = Mplc.find(mplc_id)
    @invitation_url = invitation_url

    mail(
      to: @client.email,
      from: @mplc.email,
      subject: "#{@mplc.email} would like to share his library with you"
    )
  end
end

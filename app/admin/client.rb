# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength
ActiveAdmin.register Client do
  permit_params :email

  filter :email

  actions :all, except: %i[show edit]

  index do
    selectable_column
    id_column
    column :email
    actions
  end

  form title: "Invite Client" do |f|
    f.inputs do
      f.input :email
    end
    f.actions
  end

  controller do
    def create
      result = Clients::Invite.call(email: params["client"]["email"])
      if result.success?
        redirect_to collection_url, notice: "User #{result.value!.email} invited"
      else
        @client = result.failure
        render action: "edit"
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength

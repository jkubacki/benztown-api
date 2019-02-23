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
# rubocop:enable Metrics/BlockLength

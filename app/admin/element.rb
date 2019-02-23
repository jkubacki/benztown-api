# frozen_string_literal: true

ActiveAdmin.register Element do
  permit_params :name, :file

  filter :name
  filter :created_at

  form partial: "form"

  index do
    selectable_column
    id_column
    column :name
    column :file do |element|
      audio_tag url_for(element.file), controls: true, preload: "none"
    end
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :name
      row :file do |element|
        audio_tag url_for(element.file), controls: true, preload: "none"
      end
    end
  end
end

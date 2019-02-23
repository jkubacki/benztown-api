# frozen_string_literal: true

# rubocop:disable Metrics/BlockLength
ActiveAdmin.register Element do
  permit_params :name, :file, :tag_list

  filter :name
  filter :created_at
  filter(
    :taggings_tag_name,
    label: "Tags",
    as: :check_boxes,
    collection: -> { ActsAsTaggableOn::Tag.pluck(:name).map { |name| [name, name] } }
  )

  form partial: "form"

  index do
    selectable_column
    id_column
    column :name
    column :file do |element|
      audio_tag url_for(element.file), controls: true, preload: "none"
    end
    column :tag_list
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :name
      row :file do |element|
        audio_tag url_for(element.file), controls: true, preload: "none"
      end
      row :tag_list
      row :created_at
    end
  end
end
# rubocop:enable Metrics/BlockLength

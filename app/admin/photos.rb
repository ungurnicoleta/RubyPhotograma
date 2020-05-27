# frozen_string_literal: true
ActiveAdmin.register Photo do
  permit_params :url, :photographer_id, :tags_ids

  index do
    column 'ID', &:id
    column 'URL' do |photo|
      image_tag photo.url.thumb.url if photo&.url&.thumb&.url&.present?
    end
    column 'PHOTOGRAPHER' do |photographer|
      link_to photographer.id, admin_photographer_path(photographer)
    end
    column :tags do |photo|
      photo.tags.collect(&:name).to_sentence
    end
    actions

  end

  show do
    attributes_table do
      row :id
      row :url do |photo|
        image_tag photo.url.thumb.url
      end
      row :tags do |photo|
        photo.tags.collect(&:name).to_sentence
      end
    end
  end

  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs 'Photo Details' do
      f.input :url
      f.input :photographer

      f.input :tags, collection: Tag.all,
                label_method: ->(el) { t "simple_form.options.photo.tags.#{el.name}" }
    end
    f.actions
  end
end

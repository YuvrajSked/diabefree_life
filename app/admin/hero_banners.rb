ActiveAdmin.register HeroBanner do
  # Specify parameters which should be permitted for assignment
  permit_params :title, :subtitle, :description, :rating, :patient_count, :image, :remove_image

  # or consider:
  #
  # permit_params do
  #   permitted = [:title, :subtitle, :description, :rating, :patient_count]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  # For security, limit the actions that should be available
  actions :all, except: []

  # Add or remove filters to toggle their visibility
  filter :id
  filter :title
  filter :subtitle
  filter :description
  filter :rating
  filter :patient_count
  filter :created_at
  filter :updated_at

  before_save do |hero_banner|
    if hero_banner.remove_image == '1' && hero_banner.image.attached?
      hero_banner.image.purge_later
    end
  end

  # Add or remove columns to toggle their visibility in the index action
  index do
    selectable_column
    id_column
    column :image do |hero_banner|
      if hero_banner.image.attached?
        image_tag hero_banner.image.variant(format: :png, resize_to_limit: [ 150, 150 ])
      else
        "No image"
      end
    end
    column :title
    column :subtitle
    column :description
    column :rating
    column :patient_count
    column :created_at
    column :updated_at
    actions
  end

  # Add or remove rows to toggle their visibility in the show action
  show do
    attributes_table_for(resource) do
      row :id
      row :image do |hero_banner|
        if hero_banner.image.attached?
          image_tag hero_banner.image.variant(format: :png, resize_to_limit: [ 150, 150 ])
        else
          "No image"
        end
      end
      row :title
      row :subtitle
      row :description
      row :rating
      row :patient_count
      row :created_at
      row :updated_at
    end
  end

  # Add or remove fields to toggle their visibility in the form
  form do |f|
    f.semantic_errors(*f.object.errors.attribute_names)
    f.inputs do
      if f.object.image.attached? && f.object.persisted?
        div do
          span "Current Image:"
          br
          span image_tag(f.object.image.variant(resize_to_limit: [ 250, 250 ]))
        end
        f.input :remove_image, as: :boolean, label: "Remove Image"
      else
        div do
          span "No image uploaded"
        end
      end
      f.input :image, as: :file
      f.input :title
      f.input :subtitle
      f.input :description, as: :text, input_html: { rows: 5, cols: 50 }
      f.input :rating
      f.input :patient_count
    end
    f.actions
  end
end

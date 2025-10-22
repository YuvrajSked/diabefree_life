ActiveAdmin.register Testimonial do
  # Specify parameters which should be permitted for assignment
  permit_params :name, :age, :location, :content, :hba1c_before, :hba1c_after,
                :weight_before, :weight_after, :bgl_before, :bgl_after,
                :program_duration, :approved, :image, :remove_image

  # or consider:
  #
  # permit_params do
  #   permitted = [:name, :age, :location, :content, :hba1c_before, :hba1c_after, :weight_lost, :program_duration, :approved]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  # For security, limit the actions that should be available
  actions :all, except: []

  # Add or remove filters to toggle their visibility
  filter :id
  filter :name
  filter :age
  filter :location
  filter :content
  filter :hba1c_before
  filter :hba1c_after
  filter :weight_before
  filter :weight_after
  filter :bgl_before
  filter :bgl_after
  filter :program_duration
  filter :approved
  filter :created_at
  filter :updated_at

  before_save do |testimonial|
    if testimonial.remove_image == "1" && testimonial.image.attached?
      testimonial.image.purge_later
    end
  end

  index do
    selectable_column
    id_column
    column :image do |testimonial|
      if testimonial.image.attached?
        image_tag testimonial.image.variant(resize_to_limit: [ 50, 50 ])
      else
        "No image"
      end
    end
    column :name
    column :age
    column :location
    column :hba1c_before
    column :hba1c_after
    column :weight_before
    column :weight_after
    column :bgl_before
    column :bgl_after
    column :program_duration
    column :approved
    actions
  end

  # Add or remove rows to toggle their visibility in the show action
  show do
    attributes_table_for(resource) do
      row :id
      row :image do |testimonial|
        if testimonial.image.attached?
          image_tag testimonial.image.variant(resize_to_limit: [ 200, 200 ])
        else
          "No image"
        end
      end
      row :name
      row :age
      row :location
      row :content
      row :hba1c_before
      row :hba1c_after
      row :weight_before
      row :weight_after
      row :bgl_before
      row :bgl_after
      row :program_duration
      row :approved
      row :created_at
      row :updated_at
    end
  end

  # Add or remove fields to toggle their visibility in the form
  form do |f|
    f.semantic_errors(*f.object.errors.attribute_names)
    f.inputs do
      f.inputs do
        if f.object.image.attached? && f.object.persisted?
          div do
            span "Current Image:"
            br
            span image_tag(f.object.image.variant(resize_to_limit: [ 150, 150 ]))
          end
          f.input :remove_image, as: :boolean, label: "Remove Image"
        else
          div do
            span "No image uploaded"
          end
        end
      end
      f.input :image, as: :file
      f.input :name
      f.input :age
      f.input :location
      f.input :content, as: :text, input_html: { rows: 5, cols: 50 }
      f.input :hba1c_before
      f.input :hba1c_after
      f.input :weight_before
      f.input :weight_after
      f.input :bgl_before
      f.input :bgl_after
      f.input :program_duration
      f.input :approved
    end
    f.actions
  end
end

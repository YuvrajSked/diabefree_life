ActiveAdmin.register Program do
  # Specify parameters which should be permitted for assignment
  permit_params :title, :description, :features, :price, :duration, :program_type, :active

  # or consider:
  #
  # permit_params do
  #   permitted = [:title, :description, :features, :price, :duration, :program_type, :active]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  # For security, limit the actions that should be available
  actions :all, except: []

  # Add or remove filters to toggle their visibility
  filter :id
  filter :title
  filter :description
  filter :features
  filter :price
  filter :duration
  filter :program_type, as: :select, collection: -> {
    Program.filter_enum_options(:program_type)
  }
  filter :active
  filter :created_at
  filter :updated_at

  # Add or remove columns to toggle their visibility in the index action
  index do
    selectable_column
    id_column
    column :title
    column :features
    column :price
    column :duration
    column :program_type
    column :active
    column :created_at
    column :updated_at
    actions
  end

  # Add or remove rows to toggle their visibility in the show action
  show do
    attributes_table_for(resource) do
      row :id
      row :title
      row :description
      row :features
      row :price
      row :duration
      row :program_type
      row :active
      row :created_at
      row :updated_at
    end
  end

  # Add or remove fields to toggle their visibility in the form
  form do |f|
    f.semantic_errors(*f.object.errors.attribute_names)
    f.inputs do
      f.input :title
      f.input :description, as: :text, input_html: { rows: 5, cols: 50 }
      f.input :features, as: :text, input_html: { rows: 5, cols: 50 }
      f.input :price
      f.input :duration
      f.input :program_type,as: :select, collection: Program.enum_options(:program_type)
      f.input :active
    end
    f.actions
  end
end

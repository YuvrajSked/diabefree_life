ActiveAdmin.register FaqBanner do
  # Specify parameters which should be permitted for assignment
  permit_params :title, :subtitle, :description

  # or consider:
  #
  # permit_params do
  #   permitted = [:title, :subtitle, :description]
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


  # Add or remove columns to toggle their visibility in the index action
  index do
    selectable_column
    id_column
    column :title
    column :subtitle
    column :description
    actions
  end

  # Add or remove rows to toggle their visibility in the show action
  show do
    attributes_table_for(resource) do
      row :id
      row :title
      row :subtitle
      row :description
      row :created_at
      row :updated_at
    end
  end

  # Add or remove fields to toggle their visibility in the form
  form do |f|
    f.semantic_errors(*f.object.errors.attribute_names)
    f.inputs do
      f.input :title
      f.input :subtitle
      f.input :description, as: :text, input_html: { rows: 5, cols: 50 }
    end
    f.actions
  end
end

ActiveAdmin.register Faq do
  menu priority: 1, label: "FAQs"
  # Specify parameters which should be permitted for assignment
  permit_params :question, :answer, :position, :active

  # or consider:
  #
  # permit_params do
  #   permitted = [:question, :answer, :position, :active]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  # For security, limit the actions that should be available
  actions :all, except: []

  # Add or remove filters to toggle their visibility
  filter :id
  filter :question

  filter :position
  filter :active
  filter :created_at
  filter :updated_at

  # Add or remove columns to toggle their visibility in the index action
  index do
    selectable_column
    id_column
    column :question
    column :position
    column :active
    column :created_at
    column :updated_at
    actions
  end

  # Add or remove rows to toggle their visibility in the show action
  show do
    attributes_table_for(resource) do
      row :id
      row :question
      row :answer
      row :position
      row :active
      row :created_at
      row :updated_at
    end
  end

  # Add or remove fields to toggle their visibility in the form
  form do |f|
    f.semantic_errors(*f.object.errors.attribute_names)
    f.inputs do
      f.input :question, as: :text, input_html: { rows: 5, cols: 50 }
      f.input :answer, as: :text, input_html: { rows: 5, cols: 50 }
      f.input :position
      f.input :active
    end
    f.actions
  end
end

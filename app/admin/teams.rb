ActiveAdmin.register Team do
  # Specify parameters which should be permitted for assignment
  permit_params :first_name, :last_name, :email, :phone, :designation, :facebook_profile_url, :twitter_profile_url, :linkedin_profile_url, :google_profile_url, :profile_image, :remove_profile_image,
  address_attributes: [ :id, :street, :city, :state, :country, :pincode, :_destroy ]


  # For security, limit the actions that should be available
  actions :all, except: []

  # Add or remove filters to toggle their visibility
  filter :id
  filter :first_name
  filter :last_name
  filter :email
  filter :phone
  filter :designation, as: :select, collection: -> {
    Team.filter_enum_options(:designation)
  }
  filter :facebook_profile_url
  filter :twitter_profile_url
  filter :linkedin_profile_url
  filter :google_profile_url
  filter :created_at
  filter :updated_at

  before_save do |team|
    if team.remove_profile_image == '1' && team.profile_image.attached?
      team.profile_image.purge_later
    end
  end

  # Add or remove columns to toggle their visibility in the index action
  index do
    selectable_column
    id_column
    column :profile_image do |organization|
      if organization.profile_image.attached?
        image_tag organization.profile_image.variant(format: :png, resize_to_limit: [ 150, 150 ])
      else
        "No image"
      end
    end
    column :first_name
    column :last_name
    column :email
    column :phone
    column :designation
    column :facebook_profile_url
    column :twitter_profile_url
    column :linkedin_profile_url
    column :google_profile_url
    actions
  end

  # Add or remove rows to toggle their visibility in the show action
  show do
    attributes_table_for(resource) do
      row :id
      row :profile_image do |organization|
        if organization.profile_image.attached?
          image_tag organization.profile_image.variant(format: :png, resize_to_limit: [ 150, 150 ])
        else
          "No image"
        end
      end
      row :first_name
      row :last_name
      row :email
      row :phone
      row :designation
      row :facebook_profile_url
      row :twitter_profile_url
      row :linkedin_profile_url
      row :google_profile_url
      row :created_at
      row :updated_at
    end
  end

  # Add or remove fields to toggle their visibility in the form
  form do |f|
    f.semantic_errors(*f.object.errors.attribute_names)
    f.inputs do
      if f.object.profile_image.attached? && f.object.persisted?
        div do
          span "Current Image:"
          br
          span image_tag(f.object.profile_image.variant(resize_to_limit: [ 250, 250 ]))
        end
        f.input :remove_profile_image, as: :boolean, label: "Remove Image"
      else
        div do
          span "No image uploaded"
        end
      end
      f.input :profile_image, as: :file
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :phone
      f.input :designation, as: :select, collection: Team.enum_options(:designation)
      f.input :facebook_profile_url
      f.input :twitter_profile_url
      f.input :linkedin_profile_url
      f.input :google_profile_url
    end
    f.actions
  end
end

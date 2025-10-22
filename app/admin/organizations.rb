  ActiveAdmin.register Organization do
    # Specify parameters which should be permitted for assignment
    permit_params :name, :sort_name, :description, :short_description, :phone, :status, :linkedin_profile_url, :facebook_profile_url, :twitter_profile_url, :google_profile_url,
                 :light_logo_image, :dark_logo_image, :remove_light_logo_image, :remove_dark_logo_image,
                 address_attributes: [ :id, :street, :city, :state, :country, :pincode, :_destroy ]

    # or consider:
    #
    # permit_params do
    #   permitted = [:name, :sort_name, :description, :short_description, :phone, :status, :linkedin_profile_url, :facebook_profile_url, :twitter_profile_url, :google_profile_url]
    #   permitted << :other if params[:action] == 'create' && current_user.admin?
    #   permitted
    # end

    # For security, limit the actions that should be available
    actions :all, except: []

    # Add or remove filters to toggle their visibility
    filter :id
    filter :name
    filter :sort_name
    filter :description
    filter :short_description
    filter :phone
    filter :status
    filter :linkedin_profile_url
    filter :facebook_profile_url
    filter :twitter_profile_url
    filter :google_profile_url
    filter :created_at
    filter :updated_at

    before_save do |organization|
      if organization.remove_light_logo_image == '1' && organization.light_logo_image.attached?
        organization.light_logo_image.purge_later
      end
      if organization.remove_dark_logo_image == '1' && organization.dark_logo_image.attached?
        organization.dark_logo_image.purge_later
      end
    end
    # Add or remove columns to toggle their visibility in the index action
    index do
      selectable_column
      id_column
      column :light_logo_image do |organization|
        if organization.light_logo_image.attached?
          image_tag organization.light_logo_image.variant(format: :png, resize_to_limit: [ 150, 150 ])
        else
          "No image"
        end
      end
      column :dark_logo_image do |organization|
        if organization.dark_logo_image.attached?
          image_tag organization.dark_logo_image.variant(format: :png, resize_to_limit: [ 150, 150 ])
        else
          "No image"
        end
      end
      column :name
      column :sort_name
      column :description
      column :short_description
      column :phone
      column :status
      column :linkedin_profile_url
      column :facebook_profile_url
      column :twitter_profile_url
      column :google_profile_url

      actions
    end

  # Add or remove rows to toggle their visibility in the show action
  show do
    attributes_table_for(resource) do
      row :id
      row :light_logo_image do |organization|
        if organization.light_logo_image.attached?
          image_tag rails_blob_url(organization.light_logo_image.variant(format: :png, resize_to_limit: [ 150, 150 ]))
        else
          "No light logo uploaded"
        end
      end
      row :dark_logo_image do |organization|
        if organization.dark_logo_image.attached?
          image_tag rails_blob_url(organization.dark_logo_image.variant(resize_to_limit: [ 150, 150 ]))
        else
          "No dark logo uploaded"
        end
      end
      row :name
      row :sort_name
      row :description
      row :short_description
      row :phone
      row :status
      row :linkedin_profile_url
      row :facebook_profile_url
      row :twitter_profile_url
      row :google_profile_url
      row :created_at
      row :updated_at
      row :street do |organization|
        organization.address&.street || "No Address"
      end
      row :city do |organization|
        organization.address&.city || "No Address"
      end
      row :state do |organization|
        organization.address&.state || "No Address"
      end
      row :country do |organization|
        organization.address&.country || "No Address"
      end
    end
  end

  # Add or remove fields to toggle their visibility in the form
  form do |f|
    f.semantic_errors(*f.object.errors.attribute_names)
    f.inputs "Details" do
      f.inputs do
        if f.object.light_logo_image.attached? && f.object.persisted?
          div do
            span "Current Image:"
            br
            span image_tag(f.object.light_logo_image.variant(resize_to_limit: [ 250, 250 ]))
          end
          f.input :remove_light_logo_image, as: :boolean, label: "Remove Image"
        else
          div do
            span "No image uploaded"
          end
        end
      end
      f.input :light_logo_image, as: :file
      f.inputs do
        if f.object.dark_logo_image.attached?
          div do
            span "Current Image:"
            br
            span image_tag(rails_blob_url(f.object.dark_logo_image.variant(resize_to_limit: [ 250, 250 ])))
          end
          f.input :remove_dark_logo_image, as: :boolean, label: "Remove Image"
        else
          div do
            span "No image uploaded"
          end
        end
      end
      f.input :dark_logo_image, as: :file
      f.input :name
      f.input :sort_name
      f.input :description, as: :text, input_html: { rows: 5, cols: 50 }
      f.input :short_description, as: :text, input_html: { rows: 5, cols: 50 }
      f.input :phone
      f.input :status
      f.input :linkedin_profile_url
      f.input :facebook_profile_url
      f.input :twitter_profile_url
      f.input :google_profile_url
    end
    f.inputs "Address" do
      f.object.build_address if f.object.address.nil?
      f.fields_for :address, allow_destroy: true do |address_form|
        address_form.input :street, required: true
        address_form.input :city, required: true
        address_form.input :country, as: :string, required: true
        address_form.input :state, required: true
        address_form.input :pincode, required: true
        if address_form.object.persisted?
          address_form.input :_destroy, as: :boolean, label: "Remove Address"
        end
      end
    end
    f.actions
  end
end

class CreateOrganizations < ActiveRecord::Migration[8.0]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :sort_name
      t.text :description
      t.text :short_description
      t.string :email
      t.string :phone
      t.boolean :status, default: false
      t.string :linkedin_profile_url
      t.string :facebook_profile_url
      t.string :twitter_profile_url
      t.string :google_profile_url
      t.timestamps
    end
  end
end

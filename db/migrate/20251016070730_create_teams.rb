class CreateTeams < ActiveRecord::Migration[8.0]
  def change
    create_table :teams do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.integer :designation, default: 0
      t.string :facebook_profile_url
      t.string :twitter_profile_url
      t.string :linkedin_profile_url
      t.string :google_profile_url

      t.timestamps
    end
  end
end

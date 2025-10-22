class CreateTeamBanners < ActiveRecord::Migration[8.0]
  def change
    create_table :team_banners do |t|
      t.string :title
      t.string :subtitle
      t.text :description

      t.timestamps
    end
  end
end

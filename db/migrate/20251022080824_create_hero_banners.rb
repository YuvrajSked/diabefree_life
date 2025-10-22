class CreateHeroBanners < ActiveRecord::Migration[8.0]
  def change
    create_table :hero_banners do |t|
      t.string :title
      t.string :subtitle
      t.text :description
      t.decimal :rating
      t.integer :patient_count

      t.timestamps
    end
  end
end

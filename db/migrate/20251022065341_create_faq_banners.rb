class CreateFaqBanners < ActiveRecord::Migration[8.0]
  def change
    create_table :faq_banners do |t|
      t.string :title
      t.string :subtitle
      t.text :description
      t.timestamps
    end
  end
end

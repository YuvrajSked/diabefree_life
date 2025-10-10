class CreateTestimonials < ActiveRecord::Migration[8.0]
  def change
    create_table :testimonials do |t|
      t.string :name
      t.integer :age
      t.string :location
      t.text :content
      t.decimal :hba1c_before
      t.decimal :hba1c_after
      t.decimal :weight_lost
      t.integer :program_duration
      t.boolean :approved

      t.timestamps
    end
  end
end

class CreatePrograms < ActiveRecord::Migration[8.0]
  def change
    create_table :programs do |t|
      t.string :title
      t.text :description
      t.text :features
      t.decimal :price
      t.integer :duration
      t.integer :program_type, default: 0
      t.boolean :active, default: true

      t.timestamps
    end
    add_index :programs, :program_type
  end
end

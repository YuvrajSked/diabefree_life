class CreateFaqs < ActiveRecord::Migration[8.0]
  def change
    create_table :faqs do |t|
      t.text :question, null: false
      t.text :answer, null: false
      t.integer :position, default: 0
      t.boolean :active, default: true

      t.timestamps
    end
  end
end

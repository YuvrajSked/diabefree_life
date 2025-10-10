class UpdateTestimonialsColumns < ActiveRecord::Migration[8.0]
  def change
    # Remove the weight_lost column
    remove_column :testimonials, :weight_lost, :decimal

    # Add new columns
    add_column :testimonials, :weight_before, :decimal, precision: 8, scale: 2
    add_column :testimonials, :weight_after, :decimal, precision: 8, scale: 2
    add_column :testimonials, :bgl_before, :decimal, precision: 8, scale: 2
    add_column :testimonials, :bgl_after, :decimal, precision: 8, scale: 2
  end
end

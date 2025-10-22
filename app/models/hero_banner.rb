class HeroBanner < ApplicationRecord
  has_one_attached :image

  attr_accessor :remove_image

  # Validations
  validates :title, presence: true
  validates :subtitle, presence: true
  validates :description, presence: true
  validates :rating, presence: true
  validates :patient_count, presence: true
end

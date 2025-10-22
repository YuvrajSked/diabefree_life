class FaqBanner < ApplicationRecord
  # Validations
  validates :title, presence: true
  validates :subtitle, presence: true
  validates :description, presence: true
end

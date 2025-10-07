class Program < ApplicationRecord
  # Enums
  enum :program_type, { basic: 0, premium: 1, comprehensive: 2 }

  # Scope
  scope :active, -> { where(active: true) }
  scope :inactive, -> { where(active: false) }

  # Validations
  validates :title, presence: true, length: { minimum: 3, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 1000 }
  validates :features, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :program_type, presence: true, inclusion: { in: program_types.keys }

  def self.ransackable_attributes(auth_object = nil)
    [ "active", "created_at", "description", "duration", "features", "id", "id_value", "price", "program_type", "title", "updated_at" ]
  end
end

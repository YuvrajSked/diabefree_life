class Faq < ApplicationRecord
  # Validations
  validates :question, presence: true, length: { minimum: 5, maximum: 1000 }
  validates :answer, presence: true, length: { minimum: 5, maximum: 5000 }
  validates :position, uniqueness: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  
  # Scopes
  scope :active, -> { where(active: true) }
  scope :ordered, -> { order(position: :asc) }


  # For ActiveAdmin search/filtering
  def self.ransackable_attributes(auth_object = nil)
    ["active", "answer", "created_at", "id", "position", "question", "updated_at"]
  end

  # For ActiveAdmin display name in dropdowns
  def to_s
    question.truncate(50)
  end
end

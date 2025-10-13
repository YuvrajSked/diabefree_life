class Testimonial < ApplicationRecord
  has_one_attached :image

  attr_accessor :remove_image
  # Validations

  validates :name, presence: true
  validates :age, presence: true, numericality: { greater_than_or_equal_to: 0, less_than: 120 }
  validates :location, presence: true
  validates :content, presence: true
  validates :hba1c_before, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :hba1c_after, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :weight_before, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :weight_after, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :bgl_before, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :bgl_after, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :program_duration, presence: true, numericality: { greater_than_or_equal_to: 0 }

  # Scopes
  scope :approved, -> { where(approved: true) }
  scope :recent, -> { where("created_at > ?", 1.month.ago) }
  scope :high_improvement, -> { where("hba1c_before - hba1c_after > 3") }

  # Default values
  after_initialize :set_defaults, if: :new_record?

  def self.ransackable_attributes(auth_object = nil)
    %w[ age content created_at approved hba1c_after hba1c_before id id_value location name program_duration updated_at weight_before weight_after bgl_before bgl_after ]
  end

  def hba1c_improvement_percentage
    return nil unless hba1c_before.present? && hba1c_after.present? && hba1c_before.positive?
    hba1c_improvement = hba1c_before - hba1c_after
    (hba1c_improvement / hba1c_before * 100).round(1)
  end

  # Calculate weight loss in kg and percentage
  def weight_loss
    return nil unless weight_before.present? && weight_after.present? && weight_before.positive?
    weight_before - weight_after
  end

  def weight_loss_percentage
    return nil unless weight_loss.present? && weight_before.positive?
    ((weight_loss / weight_before) * 100).round(1)
  end

  # Calculate BGL improvement
  def bgl_improvement
    return nil unless bgl_before.present? && bgl_after.present?
    bgl_before - bgl_after
  end

  def bgl_improvement_percentage
    return nil unless bgl_improvement.present? && bgl_before.positive?
    ((bgl_improvement.to_f / bgl_before) * 100).round(1)
  end

  # Format BGL with units (mg/dL)
  def formatted_bgl_before
    "#{bgl_before} mg/dL" if bgl_before.present?
  end

  def formatted_bgl_after
    "#{bgl_after} mg/dL" if bgl_after.present?
  end

  def truncated_content
    content.truncate(250, separator: "", omission: "...")
  end

  private

  def set_defaults
    self.approved = false if approved.nil?
  end
end

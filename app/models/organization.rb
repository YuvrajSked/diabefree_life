class Organization < ApplicationRecord

  # Associations
  has_one_attached :light_logo_image
  has_one_attached :dark_logo_image
  has_one :address, as: :addressable, dependent: :destroy
  accepts_nested_attributes_for :address, allow_destroy: true

  attr_accessor :remove_light_logo_image, :remove_dark_logo_image

  # Validation
  validates :name, presence: true
  validates :sort_name, presence: true
  validates :description, presence: true
  validates :short_description, presence: true
  validates :phone, presence: true
  validates :status, presence: true
  validates :linkedin_profile_url, presence: true
  validates :facebook_profile_url, presence: true
  validates :twitter_profile_url, presence: true
  validates :google_profile_url, presence: true
  validate :only_one_organization_allowed

  # Ransackable attributes
  def self.ransackable_attributes(auth_object = nil)
    [ "created_at", "description", "facebook_profile_url", "google_profile_url", "id", "id_value", "linkedin_profile_url", "name", "phone", "short_description", "sort_name", "status", "twitter_profile_url", "updated_at" ]
  end


  private

  def only_one_organization_allowed
    if Organization.exists? && new_record?
      errors.add(:base, "Only one organization is allowed")
    end
  end
end

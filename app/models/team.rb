class Team < ApplicationRecord
  # Associations
  has_one :address, as: :addressable, dependent: :destroy
  accepts_nested_attributes_for :address, allow_destroy: true

  has_one_attached :profile_image

  # Enums
  enum :designation, { doctor: 0, nutritionist: 1, coach: 2 }

  # Validations
  validates :first_name, :last_name, :email, :designation, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :phone, presence: true, uniqueness: true
  validates :designation, presence: true, inclusion: { in: designations.keys }
  validates :facebook_profile_url, :twitter_profile_url,
            :linkedin_profile_url, :google_profile_url,
            format: { with: URI::DEFAULT_PARSER.make_regexp(%w[http https]), allow_blank: true }

  # Ransackable attributes
  # def self.ransackable_attributes(auth_object = nil)
  #   [ "created_at", "designation", "email", "facebook_profile_url", "first_name", "google_profile_url", "id", "last_name", "linkedin_profile_url", "phone", "twitter_profile_url", "updated_at" ]
  # end

  # def self.ransackable_associations(auth_object = nil)
  #   [ "address", "profile_image_attachment", "profile_image_blob" ]
  # end

  def full_name
    "#{first_name} #{last_name}"
  end
end

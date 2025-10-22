class Address < ApplicationRecord
  # Association
  belongs_to :addressable, polymorphic: true

  # Validation
  validates :street, :city, :state, :country, :pincode, presence: true

  def full_address
    "#{street}, #{city}, #{state}, #{country}"
  end
end

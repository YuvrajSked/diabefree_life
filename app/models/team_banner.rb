class TeamBanner < ApplicationRecord
  # Validations
  validates :title, presence: true
  validates :subtitle, presence: true
  validates :description, presence: true

  # def self.ransackable_attributes(auth_object = nil)
  #   [ "created_at", "description", "id", "subtitle", "title", "updated_at" ]
  # end
end

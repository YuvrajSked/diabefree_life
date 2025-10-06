class ProgramSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :features, :price, :duration, :program_type, :active, :created_at, :updated_at
end

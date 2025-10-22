class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def self.ransackable_associations(auth_object = nil)
    []
  end

  def self.ransackable_attributes(auth_object = nil)
    columns.map(&:name) - %w[created_at updated_at]
  end

  def self.filter_enum_options(field_name)
    self.send(field_name.to_s.pluralize).map { |key, value| [key.titleize, value] }
  end

  def self.select_options(field_name, field_value = :id)
    self.all.collect{|s| [s.send(field_name), s.send(field_value)]}
  end

  def self.enum_options(field_name)
    self.send(field_name.to_s.pluralize).keys.map { |key| [key.titleize, key] }
  end
end

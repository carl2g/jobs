class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def self.select_except(*exceptions)
    attributes_to_select = self.attributes_except(*exceptions)
    self.select(attributes_to_select)
  end

private

  def self.attributes_except(*exceptions)
    self.attribute_names.map(&:to_sym) - exceptions.map(&:to_sym)
  end

end

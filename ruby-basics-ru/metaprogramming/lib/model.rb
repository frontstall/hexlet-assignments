# frozen_string_literal: true

# BEGIN
module Model
  def initialize(attributes = {})
    @attributes = attributes
  end

  def self.included(base)
    base.extend(AttributeMethods)
  end

  def attributes
    @attributes.merge(@attributes) { |key| send key }
  end

  module AttributeMethods
    def attribute(name, options = {})
      define_method(name) do
        value = @attributes[name]

        coerce(value, options[:type])
      end

      define_method("#{name}=") do |value|
        @attributes[name] = value
      end
    end
  end

  def coerce(value, type)
    return nil if value.nil?

    return value.to_s if type == :string
    return value.to_i if type == :integer
    return (Date.parse value).to_datetime if type == :datetime

    value
  end
end
# END

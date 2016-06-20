require 'csv'

class Exporter

  attr_reader :data

  def initialize(data)
    @data = data
  end

  def call
    return unless data.present?
    if data.respond_to?(:size)
      CSV.generate do |c|
        c << data.first.attributes.keys
        data.each do |d|
          c << d.attributes.values
        end
      end
    else
      CSV.generate do |c|
        c << data.attributes.keys
        c << data.attributes.values
      end
    end
  end
end

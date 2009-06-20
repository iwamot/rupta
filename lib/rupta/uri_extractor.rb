require 'rubygems' if RUBY_VERSION < '1.9.0'
require 'addressable/template'

class Rupta
  class UriExtractor
    def initialize(uri_extract_processor)
      @uri_extract_processor = uri_extract_processor
    end

    def extract(uri_templates, uri)
      uri_templates.each do |uri_template|
        uri_parameters = Addressable::Template.new(uri_template).extract(uri, @uri_extract_processor)
        return [uri_template, uri_parameters] if uri_parameters
      end
      nil
    end
  end
end

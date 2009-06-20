require 'rubygems' if RUBY_VERSION < '1.9.0'
require 'addressable/uri'

class Rupta
  class UriPurifier
    def purify(uri, omittable_uri_components)
      Addressable::URI.parse(uri).omit(*omittable_uri_components)
    end
  end
end

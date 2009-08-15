require 'rubygems' if RUBY_VERSION < '1.9.0'
require 'addressable/uri'

class Rupta
  class UriParser
    def parse(uri)
      Addressable::URI.parse(uri)
    end
  end
end

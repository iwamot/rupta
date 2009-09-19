require 'rubygems' if RUBY_VERSION < '1.9.0'
require 'addressable/uri'

class Rupta
  module Helper
    class UriParser
      def parse(uri)
        Addressable::URI.parse(uri)
      end
    end
  end
end

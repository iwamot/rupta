class Rupta
  module Helper
    class UriPurifier
      def initialize(uri_parser)
        @uri_parser = uri_parser
      end

      def purify(uri, omittable_uri_components)
        @uri_parser.parse(uri).omit(*omittable_uri_components)
      end
    end
  end
end

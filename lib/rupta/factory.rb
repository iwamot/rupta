require 'rupta'
require 'rupta/helper/uri_extract_processor/default'
require 'rupta/helper/uri_extractor'
require 'rupta/helper/uri_parser'
require 'rupta/helper/uri_purifier'

class Rupta
  class Factory
    def initialize(uri_extract_processor = Rupta::Helper::UriExtractProcessor::Default.new)
      @uri_extract_processor = uri_extract_processor
    end

    def create
      Rupta.new(
        Rupta::Helper::UriPurifier.new(Rupta::Helper::UriParser.new),
        Rupta::Helper::UriExtractor.new(@uri_extract_processor)
      )
    end
  end
end

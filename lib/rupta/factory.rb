require 'rupta'
require 'rupta/uri_extract_processor/default'
require 'rupta/uri_extractor'
require 'rupta/uri_purifier'
require 'rupta/yaml_loader'

class Rupta
  class Factory
    def create(uri_extract_processor = Rupta::UriExtractProcessor::Default.new)
      Rupta.new(
        Rupta::UriPurifier.new,
        Rupta::UriExtractor.new(uri_extract_processor),
        Rupta::YamlLoader.new
      )
    end
  end
end

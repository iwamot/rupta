require 'rupta/factory'
require 'rupta/helper/uri_extract_processor/default'
require 'rupta/helper/yaml_loader'
require 'rupta/yaml'

class Rupta
  class Yaml
    class Factory
      def initialize(uri_extract_processor = Rupta::Helper::UriExtractProcessor::Default.new)
        @uri_extract_processor = uri_extract_processor
      end

      def create
        Rupta::Yaml.new(
          Rupta::Factory.new(@uri_extract_processor).create,
          Rupta::Helper::YamlLoader.new
        )
      end
    end
  end
end

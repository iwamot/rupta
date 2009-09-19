require 'yaml'

class Rupta
  module Helper
    class YamlLoader
      def load_file(path)
        YAML.load_file(path)
      end
    end
  end
end

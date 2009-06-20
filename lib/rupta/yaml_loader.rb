require 'yaml'

class Rupta
  class YamlLoader
    def load_file(path)
      YAML.load_file(path)
    end
  end
end

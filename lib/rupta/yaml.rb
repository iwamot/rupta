class Rupta
  class Yaml
    def initialize(router, yaml_loader)
      @router = router
      @yaml_loader = yaml_loader
    end

    def detect(yaml_path, uri, omit_uri_components = [:query])
      routes = @yaml_loader.load_file(yaml_path)
      @router.detect(routes, uri, omit_uri_components)
    end
  end
end

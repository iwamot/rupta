class Rupta
  class Yaml
    def initialize(router, yaml_loader)
      @router = router
      @yaml_loader = yaml_loader
    end

    def detect(path, uri, omittable_uri_components = [:query])
      routes = @yaml_loader.load_file(path)
      @router.detect(routes, uri, omittable_uri_components)
    end
  end
end

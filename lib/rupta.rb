class Rupta
  def initialize(uri_purifier, uri_extractor, yaml_loader)
    @uri_purifier = uri_purifier
    @uri_extractor = uri_extractor
    @yaml_loader = yaml_loader
  end

  def detect_with_hash(routes, uri, omittable_uri_components = [:query])
    pure_uri = @uri_purifier.purify(uri, omittable_uri_components)
    routes.each do |route_name, uri_templates|
      uri_template, uri_parameters = @uri_extractor.extract(uri_templates, pure_uri)
      return [route_name, uri_template, uri_parameters] if uri_template
    end
    nil
  end

  def detect_with_file(yaml_path, uri, omittable_uri_components = [:query])
    self.detect_with_hash(@yaml_loader.load_file(yaml_path), uri, omittable_uri_components)
  end

  alias :detect :detect_with_file
end

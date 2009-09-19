class Rupta
  def initialize(uri_purifier, uri_extractor)
    @uri_purifier = uri_purifier
    @uri_extractor = uri_extractor
  end

  def detect(routes, uri, omittable_uri_components = [:query])
    pure_uri = @uri_purifier.purify(uri, omittable_uri_components)
    routes.each do |route_name, uri_templates|
      uri_template, uri_parameters = @uri_extractor.extract(uri_templates, pure_uri)
      return [route_name, uri_template, uri_parameters] if uri_template
    end
    nil
  end
end

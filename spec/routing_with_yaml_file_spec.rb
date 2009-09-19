begin
  require 'rupta/yaml/factory'
rescue LoadError
  $LOAD_PATH << File.expand_path('../lib', File.dirname(__FILE__))
  require 'rupta/yaml/factory'
end

describe "Rupta::Yaml#detect" do
  before(:all) do
    @yaml_path = File.expand_path('fixtures/routes.yml', File.dirname(__FILE__))
    @router = Rupta::Yaml::Factory.new.create
  end

  it "should detect a correct route" do
    route_name, uri_template, uri_parameters = @router.detect(@yaml_path, 'http://example.com/bookmarks/123.atom')
    route_name.should == 'bookmark'
    uri_template.should == 'http://example.com/bookmarks/{bookmark_id}.{format}'
    uri_parameters.values_at('bookmark_id', 'format').should == ['123', 'atom']
  end

  describe "when passed a static URI" do
    it "should return an empty hash as the URI parameters" do
      route_name, uri_template, uri_parameters = @router.detect(@yaml_path, 'http://example.com/static_path')
      uri_parameters.should be_empty
    end
  end

  describe "when passed a URI which has query strings" do
    it "should omit the query strings" do
      route_name, uri_template, uri_parameters = @router.detect(@yaml_path, 'http://example.com/search?q=foo')
      route_name.should == 'search'
      uri_template.should == 'http://example.com/search'
      uri_parameters.should be_empty
    end
  end

  describe "when passed an invalid URI" do
    it "should return nil" do
      result = @router.detect(@yaml_path, 'http://example.com/not_found')
      result.should be_nil
    end
  end
end

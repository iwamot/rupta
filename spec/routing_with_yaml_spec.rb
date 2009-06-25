begin
  require 'rupta/factory'
rescue LoadError
  $LOAD_PATH << File.expand_path('../lib', File.dirname(__FILE__))
  require 'rupta/factory'
end

describe "Rupta#detect" do
  before(:all) do
    @yaml_path = File.expand_path('fixtures/routes.yml', File.dirname(__FILE__))
    @rupta = Rupta::Factory.create
  end

  it "should detect a correct route" do
    route_name, uri_template, uri_parameters = @rupta.detect(@yaml_path, 'http://example.com/bookmarks/123.atom')
    route_name.should == 'bookmark'
    uri_template.should == 'http://example.com/bookmarks/{bookmark_id}.{format}'
    uri_parameters.values_at('bookmark_id', 'format').should == ['123', 'atom']
  end

  describe "when passed a static URI" do
    it "should return an empty hash as the URI parameters" do
      route_name, uri_template, uri_parameters = @rupta.detect(@yaml_path, 'http://example.com/static_path')
      uri_parameters.should be_empty
    end
  end

  describe "when passed a URI which has query strings" do
    it "should omit the query strings" do
      route_name, uri_template, uri_parameters = @rupta.detect(@yaml_path, 'http://example.com/search?q=foo')
      route_name.should == 'search'
      uri_template.should == 'http://example.com/search'
      uri_parameters.should be_empty
    end
  end

  describe "when passed an invalid URI" do
    it "should return nil" do
      result = @rupta.detect(@yaml_path, 'http://example.com/not_found')
      result.should be_nil
    end
  end
end

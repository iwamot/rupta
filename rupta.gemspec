# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rupta}
  s.version = "0.9.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["IWAMOTO Takashi"]
  s.date = %q{2009-08-15}
  s.description = %q{Rupta is a router library for Web applications. The routes can be defined with URI Template.}
  s.email = %q{hello@iwamot.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    "CHANGELOG",
     "LICENSE",
     "README.rdoc",
     "lib/rupta.rb",
     "lib/rupta/factory.rb",
     "lib/rupta/uri_extract_processor/default.rb",
     "lib/rupta/uri_extractor.rb",
     "lib/rupta/uri_parser.rb",
     "lib/rupta/uri_purifier.rb",
     "lib/rupta/yaml_loader.rb"
  ]
  s.homepage = %q{http://github.com/iwamot/rupta}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{A template-based URI router}
  s.test_files = [
    "spec/routing_with_yaml_spec.rb",
     "spec/routing_with_hash_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<addressable>, [">= 2.1.0"])
    else
      s.add_dependency(%q<addressable>, [">= 2.1.0"])
    end
  else
    s.add_dependency(%q<addressable>, [">= 2.1.0"])
  end
end
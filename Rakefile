require 'rubygems' if RUBY_VERSION < '1.9.0'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = 'rupta'
    gem.summary = 'A template-based URI router'
    gem.description = 'Rupta is a router library for Web applications. The routes can be defined with URI Template.'
    gem.author = 'IWAMOTO Takashi'
    gem.email = 'hello@iwamot.com'
    gem.homepage = 'http://github.com/iwamot/rupta'

    gem.require_path = 'lib'
    gem.add_dependency('addressable', '>= 2.1.0')
    gem.files = FileList['lib/**/*.rb', 'README.rdoc', 'LICENSE', 'CHANGELOG']

    gem.has_rdoc = true

    gem.test_files = FileList['spec/**/*_spec.rb']
  end

rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end


task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  if File.exist?('VERSION.yml')
    config = YAML.load(File.read('VERSION.yml'))
    version = "#{config[:major]}.#{config[:minor]}.#{config[:patch]}"
  else
    version = ""
  end

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "Rupta-#{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('LICENSE')
  rdoc.rdoc_files.include('CHANGELOG')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

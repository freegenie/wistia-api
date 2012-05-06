#encoding: utf-8
require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  gem.name = "wistia-api"
  gem.homepage = "http://github.com/kr1/wistia-api"
  gem.license = "MIT"
  gem.summary = %Q{Ruby wrapper for Wistia's API}
  gem.description = %Q{A ruby library for working with Wistia's data API.}
  gem.email = "kri@exelab.eu"
  gem.authors = ["Jim Bancroft", "Mark Bates", "Christian Wörner"]
  gem.add_runtime_dependency 'activeresource', '>= 3.1.1'
  gem.add_runtime_dependency 'configatron', '>= 2.6.4'
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "wistia-api #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end


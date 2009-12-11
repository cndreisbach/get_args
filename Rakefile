require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "get_args"
    gemspec.summary = "Allows one to introspect on the argument names and defaults for a method."
    gemspec.description = %Q[
      Extracted from Merb, get_args allows you to query a method for its argument names and defaults.
      
      This gem exists so you can get this functionality without having to include all of Merb.
    ].strip
    gemspec.email = "crnixon@gmail.com"
    gemspec.homepage = "http://github.com/crnixon/get_args"
    gemspec.authors = ["maiha", "Yehuda Katz"]
    gemspec.add_dependency('extlib', '>= 0.9.13')
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install jeweler"
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

task :test => :check_dependencies

task :default => :test

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "get_args #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

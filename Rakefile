$:.unshift File.dirname(__FILE__) + '/lib'
require 'rstack'

RStack::Configuration.new do |config|
  config.gem_name           = "rstack"
  config.summary            = "Provides a gem library generator and helpful rake tasks"
  config.author             = 'jeremy burks'
  config.email              = "jeremy.burks@gmail.com"
  config.url                = "http://rstack.googlecode.com"
  config.has_rdoc           = true
  config.version            = RStack::Version::STRING
  config.executables        = ["rstack"]
  config.package_filelist.add  *['templates/**/*', 'vendor/**/*']
end

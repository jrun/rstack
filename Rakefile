$:.unshift File.join(File.dirname(__FILE__), 'lib')
require 'rstack'
require 'rstack/configuration'

RStack::Configuration.new 'rstack' do |config|
  config.summary            = "Provides a gem library generator and helpful rake tasks"
  config.author             = 'jeremy burks'
  config.email              = "jeremy.burks@gmail.com"
  config.url                = "http://github.com/jrun/rstack/wikis"
  config.has_rdoc           = true
  config.version            = RStack::Version::STRING
  config.executables        = ["rstack"]
  config.package_filelist.add  *['templates/**/*', 'vendor/**/*']
end

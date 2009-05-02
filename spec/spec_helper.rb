$:.unshift(File.dirname(__FILE__) + '/../lib')
require 'rstack'
require 'rstack/configuration'

# extension modules for use in specs
Dir.glob(File.dirname(__FILE__) + '/shared/*.rb').each {|f| require f }

module SpecHelper
  def null_mock(name, options = {})
    mock name, options.merge(:null_object => true)
  end
  
  alias :null_stub :null_mock
end

Spec::Runner.configure do |config|
  config.include(SpecHelper)
end

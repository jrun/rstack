require 'rubygems'
require 'pathname'

module RStack
  def self.root
    @root ||= Pathname.new(File.dirname(__FILE__)).parent.expand_path
  end
  
  def self.vendor
    @vendor ||= root.join('vendor')
  end
end


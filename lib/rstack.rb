require 'rubygems'
require 'extlib'

module RStack
  def self.root
    Pathname.new(File.dirname(__FILE__)).parent.expand_path
  end
  
  def self.vendor
    root / 'vendor'
  end
end

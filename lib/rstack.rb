module RStack
  def self.root
    File.expand_path File.join(File.dirname(__FILE__), '..')
  end
  
  def self.vendor
    File.join root, 'vendor'
  end
end

Dir[RStack.vendor + "/**"].each do |dir| 
  $:.unshift File.directory?(lib = "#{dir}/lib") ? lib : dir
end

require 'rubygems'
require 'active_support'
require 'rubygems'
require 'rake/gempackagetask'
require 'spec/rake/spectask'

require 'rstack/version'
require 'rstack/pathize'
require 'rstack/configuration'
require 'rstack/generator'

Dir[RStack.root + "/lib/rstack/tasks/*.rb"].each {|f| require f }




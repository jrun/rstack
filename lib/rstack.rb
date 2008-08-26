require 'rubygems'
require 'rstack/facets_time_monkey_patch'
require 'facets'
require 'facets/pathname'

module RStack
  def self.root
    Pathname.new(File.dirname(__FILE__)).parent.expand_path
  end
  
  def self.vendor
    root / 'vendor'
  end
end

Dir[RStack.vendor / '**'].each do |dir| 
  $:.unshift File.directory?(lib = "#{dir}/lib") ? lib : dir
end

require 'rake/gempackagetask'
require 'spec/rake/spectask'

require 'rstack/version'
require 'rstack/configuration'
require 'rstack/generator'

Dir[RStack.root / 'lib/rstack/tasks/*.rb'].each {|f| require f }

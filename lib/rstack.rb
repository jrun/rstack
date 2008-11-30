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

Pathname.glob((RStack.vendor / '**').to_s).each do |dir| 
  $:.unshift File.directory?(lib = "#{dir}/lib") ? lib : dir
end

require 'rake/gempackagetask'
require 'spec/rake/spectask'

require 'rstack/version'
require 'rstack/configuration'
require 'rstack/generator'

Pathname.glob((RStack.root / 'lib/rstack/tasks/*.rb').to_s).each {|f| require f }

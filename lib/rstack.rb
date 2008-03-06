RSTACK_ROOT = File.expand_path(File.dirname(__FILE__) + "/..")
RSTACK_VENDOR = File.join RSTACK_ROOT, "vendor"

Dir[RSTACK_ROOT + "/vendor/**"].each do |dir| 
  $:.unshift File.directory?(lib = "#{dir}/lib") ? lib : dir
end

require 'active_support'
require 'rubygems'
require 'rake/gempackagetask'
require 'spec/rake/spectask'

require 'rstack/version'
require 'rstack/pathize'
require 'rstack/configuration'
require 'rstack/generator'


Dir[RSTACK_ROOT + "/lib/rstack/tasks/*.rb"].each {|f| require f }




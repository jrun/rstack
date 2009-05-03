Dir[RStack.vendor.join('**').to_s].each do |dir| 
  $:.unshift File.directory?(lib = "#{dir}/lib") ? lib : dir
end

require 'rake/gempackagetask'
require 'spec/rake/spectask'

require 'rstack/core_ext'
require 'rstack/version'
require 'rstack/generator'

Dir[RStack.root.join('lib/rstack/tasks/*.rb').to_s].each {|f| require f }

module RStack
  class Configuration        
    attr_accessor :gem_name, :summary, :author, :email, :url, :version,
                  :platform, :spec_filelist, :package_filelist, :require_path,
                  :has_rdoc, :rdoc_files, :outpath, :executables, :dependencies,
                  :runtime_dependencies, :development_dependencies
    
    attr_reader :outpath
    
    def initialize(gem_name)      
      @gem_name         = gem_name
      @summary          = '[ENTER A SUMMARY]'
      @author           = '[ENTER A AUTHOR]'
      @email            = '[ENTER YOUR EMAIL]'
      @url              = '[ENTER A PROJECT URL]'
      @require_path     = 'lib'
      @version          = "0.1.0"
      @platform         = ::Gem::Platform::RUBY
      @package_filelist = FileList['[a-zA-Z]*', 'bin/**/*', 'lib/**/*', 'spec/**/*']
      @spec_filelist    = FileList['spec/**/*_spec.rb']
      @rdoc_files       = ['README.txt', 'CHANGELOG.txt', "LICENSE.txt", 'lib/**/*.rb']  
      @has_rdoc         = false
      @executables      = []
      @dependencies     = {}
      @runtime_dependencies     = {}
      @development_dependencies = {}
      @outpath = ENV["CC_BUILD_ARTIFACTS"] || default_outpath
      
      unless File.exist?(@outpath)
        FileUtils.mkdir(@outpath) 
      end

      yield self if block_given?

      define_tasks
    end
    
    def files
      @files ||= filelist_to_cleaned_a @package_filelist
    end
    
    def spec_files
      @spec_files ||= filelist_to_cleaned_a @spec_filelist
    end
    
    def define_tasks
      RSpec.define_tasks  self
      Gem.define_tasks    self
      RDoc.define_tasks   self if @has_rdoc
            
      task :default => :spec
      task :repackage => :spec
      task :cruise  do
        ::Rake::Task[:repackage].invoke
        ::Rake::Task[:rdoc].invoke if @has_rdoc
      end
    end
    
    def filelist_to_cleaned_a(filelist)
      filelist.to_a.delete_if {|file| !! (file =~ /\.gemspec|\.svn|rdoc|pkg|out/) }
    end
    private :filelist_to_cleaned_a
    
    def default_outpath
      File.join(FileUtils.getwd, 'out')
    end
    private :default_outpath
  end
end

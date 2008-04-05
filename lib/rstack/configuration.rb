module RStack
  class Configuration        
    attr_accessor :gem_name, :summary, :author, :email, :url, :version,
                  :platform, :spec_filelist, :package_filelist, :require_path,
                  :has_rdoc, :rdoc_files, :outpath, :executables, :dependencies
    
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

      @outpath = ENV["CC_BUILD_ARTIFACTS"] || returning(FileUtils.getwd + '/out') do |out|
        FileUtils.mkdir(out) unless File.exist?(out)
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
      task :repackage => "spec:with_coverage"
      task :cruise  do
        ::Rake::Task[:repackage].invoke
        ::Rake::Task[:rdoc].invoke if @has_rdoc
      end
    end
    
    private
      def filelist_to_cleaned_a(filelist)
        filelist.to_a.delete_if {|file| file.include?('.svn') || file.include?('rdoc') } 
      end
  end
end

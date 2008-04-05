module RStack
  class RDoc
    def self.define_tasks(configuration)
      require 'rake/rdoctask'
      ::Rake::RDocTask.new do |rdoc|
        rdoc.rdoc_files.add configuration.rdoc_files
        rdoc.rdoc_dir = configuration.outpath + '/doc'
        rdoc.title    = "#{configuration.gem_name} -- #{configuration.version}"
        rdoc.main     = 'README.txt'
        rdoc.template = RStack.vendor + "/allison-2.0.2/lib/allison"
        rdoc.options  << '--line-numbers' << '--inline-source'
      end      
    end
  end
end
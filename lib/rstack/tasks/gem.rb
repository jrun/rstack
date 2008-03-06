module RStack
  class Gem
    def self.define_tasks(configuration)
      ::Gem::manage_gems
      spec = ::Gem::Specification.new do |s|
        s.name      = configuration.gem_name
        s.version   = configuration.version
        s.platform  = configuration.platform
        s.summary   = configuration.summary
        s.author    = configuration.author
        s.email     = configuration.email
        s.homepage  = configuration.url

        unless configuration.gem_name == 'rstack'
          s.add_dependency "rstack", ">= #{RStack::Version::STRING}"
        end
        
        s.add_dependency 'rake',      '>= 0.7.2'
        s.add_dependency 'rcov',      '>= 0.8.0'
        s.add_dependency 'diff-lcs',  '>= 1.1.2'        
        s.add_dependency 'rspec',     '>= 1.1.1'

        configuration.dependencies.each do |dependency, version|
          s.add_dependency dependency, version
        end
              
        s.files             = configuration.files
        s.executables       = configuration.executables
        s.require_path      = configuration.require_path
        s.has_rdoc          = configuration.has_rdoc
        s.extra_rdoc_files  = ["README.txt"]
      end
      ::Rake::GemPackageTask.new(spec) { |p| p.gem_spec = spec }     
    end
  end
end

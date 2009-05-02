module RStack
  class Gem
    def self.define_tasks(configuration)
      spec = ::Gem::Specification.new do |s|
        s.name      = configuration.gem_name
        s.version   = configuration.version
        s.platform  = configuration.platform
        s.summary   = configuration.summary
        s.author    = configuration.author
        s.email     = configuration.email
        s.homepage  = configuration.url

        unless configuration.gem_name == 'rstack'
          s.add_development_dependency "rstack", ">= #{RStack::Version::STRING}"
        end
        
        s.add_dependency 'rake', '>= 0.8.1'
        s.add_dependency 'extlib'
        s.add_development_dependency 'rcov',          '>= 0.8.0'
        s.add_development_dependency 'diff-lcs',      '>= 1.1.2'        
        s.add_development_dependency 'rspec',         '>= 1.1.3'

        configuration.dependencies.each do |dependency, version|
          s.add_dependency dependency, version
        end

        configuration.runtime_dependencies.each do |dependency, version|
          s.add_runtime_dependency dependency, version
        end

         configuration.development_dependencies.each do |dependency, version|
          s.add_development_dependency dependency, version
        end
        
        s.files             = configuration.files
        s.executables       = configuration.executables
        s.require_path      = configuration.require_path
        s.has_rdoc          = configuration.has_rdoc
        #s.extra_rdoc_files  = ["README.txt"]
      end
      ::Rake::GemPackageTask.new(spec) { |p| p.gem_spec = spec }
            
      namespace :gem do
        desc "Repackage gem, uninstall and install again (does not use sudo)."
        task :refresh => :repackage do
          system "gem uninstall #{configuration.gem_name} -v #{configuration.version}"
          system "gem install pkg/#{configuration.gem_name}-#{configuration.version}.gem"
        end
        
        desc "Create a gemspec file"
        task :spec do
          File.open("#{configuration.gem_name}.gemspec", "w") do |file|
            file.puts spec.to_ruby
          end
        end
      end
      
    end
  end
end

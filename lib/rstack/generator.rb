module RStack
  class Generator
    
    attr_reader :project_name, :pathized_project_name, :path, :main, :main_path, 
                :module_name, :templates_path
    
    def initialize(project_name)
      @project_name           = project_name.downcase
      @pathized_project_name  = @project_name.underscore
      @module_name            = @pathized_project_name.camelize
      @path                   = Pathname.new(@project_name).expand_path
      
      parts = @pathized_project_name.split("/")
      @main = parts.last + ".rb"
      @main_path = Pathname.new((parts - [parts.last]).join("/"))
      @templates_path = RStack.root.join('templates')
    end
    
    def paths
      {
        :bin      => path.join('bin'),
        :lib      => path.join('lib'),
        :main     => path.join('lib', @main_path),
        :project  => path.join('lib', @pathized_project_name),
        :spec     => path.join('spec')
      }
    end
        
    def run
      create_directories
      move_template "Rakefile",         path.join('Rakefile')
      move_template "README.txt",       path.join('README.txt')
      move_template "cruise_config.rb", path.join('cruise_config.rb')
      move_template "main.rb",          paths[:main].join(@main)
      move_template "version.rb",       paths[:project].join('version.rb')
      move_template "spec_helper.rb",   paths[:spec].join('spec_helper.rb')
    end
  
    def create_directories
      paths.values.each do |path|
        puts "creating #{path}"
        path.mkpath
      end
    end

    def move_template(template_name, destination_path)
      puts "moving #{template_name} to #{destination_path}"
      contents = File.read(templates_path + template_name)
      File.open(destination_path, 'w') do |f| 
        f << eval('"' + contents + '"')
      end
    end
    
    def author
      ENV['USERNAME'] || ENV['USER'] || '[ENTER YOUR USERNAME]'
    end
  end
end

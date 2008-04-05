module RStack
  class Generator
    
    attr_reader :project_name, :pathized_project_name, :path, :main, :main_path, 
                :module_name, :templates_path, :active_support_path
    
    def initialize(project_name)
      @project_name           = project_name.downcase
      @pathized_project_name  = @project_name.pathize
      @module_name            = @pathized_project_name.classify
      @path                   = Pathname.new @project_name
      
      returning @pathized_project_name.split("/") do |parts|
        @main = parts.last + ".rb"
        path_without_last = (parts - [parts.last]).join("/")
        @main_path = Pathname.new path_without_last
      end
      
      @templates_path       = Pathname.new(RStack.root) + 'templates'     
      @active_support_path  = Pathname.new(File.dirname(__FILE__) + '/vendor/activesupport') 
    end
    
    def paths
      {
        :bin         => path + "bin",
        :lib         => path + 'lib',
        :main        => path + "lib" + @main_path,
        :project     => path + "lib" + @pathized_project_name,
        :spec        => path + "spec",
        :spec_shared => path + "spec/shared"
      }
    end
        
    def run
      create_directories
      move_template "Rakefile",         path + "Rakefile"
      move_template "README.txt",       path + "README.txt"
      move_template "cruise_config.rb", path + "cruise_config.rb"      
      move_template "main.rb",          paths[:main] + @main
      move_template "version.rb",       paths[:project] + "version.rb"
      move_template "spec_helper.rb",   paths[:spec] + "spec_helper.rb"
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
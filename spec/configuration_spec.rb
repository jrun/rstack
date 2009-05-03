require File.dirname(__FILE__) + '/spec_helper'


describe RStack::Configuration do
  before(:each) do
    @config = RStack::Configuration.new('rstack')
  end
  
  it "should have a #gem_name equal to the name give to initialize" do
    @config.gem_name.should == 'rstack'
  end
  
  it "should default the version to 0.1.0" do
    @config.version.should == '0.1.0'
  end
  
  it "should default the require path to 'lib'" do
    @config.require_path.should == 'lib'
  end
  
  it "should default the platform to ruby" do
    @config.platform.should == Gem::Platform::RUBY
  end

  it "should define a 'spec' task" do
    Rake::Task.should be_task_defined("spec")
  end
  
  it "should define a 'spec:full' task" do
    Rake::Task.should be_task_defined("spec:with_coverage")
  end
  
  it "should not define a 'rdoc' task by default" do
    Rake::Task.should_not be_task_defined("rdoc")
  end
  
  it "should define a repackage task" do
    Rake::Task.should be_task_defined("repackage")
  end
  
  it "should define an rdoc task if 'has_rdoc' is true" do
    RStack::Configuration.new('rstack') {|config| config.has_rdoc = true }
    Rake::Task.should be_task_defined("rdoc")    
  end
  
  it "should define a 'cruise' task" do
    Rake::Task.should be_task_defined("cruise")
  end

end

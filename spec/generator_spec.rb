require File.dirname(__FILE__) + '/spec_helper'

describe RStack::Generator do
  before(:each) do
    @generator = RStack::Generator.new("Foo")
  end
  
  it "should assign the given project name downcased to the project name attribute" do
    @generator.project_name.should == "foo"
  end
  
  it "should assign the given project name classified to the module name attribute" do
    generator = RStack::Generator.new("classified_project")
    generator.module_name.should == "ClassifiedProject"
  end

  it "should have a path equal to the project name" do
    @generator.path.should == Pathname.new(@generator.project_name).expand_path
  end
  
  it "should have a pathized project name" do
    @generator.pathized_project_name.should == "foo"
  end
    
  it "should assign the last element to be the name of main .rb file" do
    @generator.main.should == "foo.rb"
  end
  
  it "should have a lib path should include the elements of the dasherized project name" do
    @generator.paths[:lib].should == RStack.root.join("foo/lib")
  end
  
  it "should have a main path that includes all the pathized elements but the last" do
    @generator.paths[:main].should == RStack.root.join("foo/lib")
  end

  it "should have a project path that includes the pathized elements" do
    @generator.paths[:project].should == RStack.root.join("foo/lib/foo")
  end    
end

describe RStack::Generator, "#move_template" do
  before(:each) do
    File.stub!(:read).and_return("foo")
    File.stub!(:open)
    @generator = RStack::Generator.new("foo")
  end
  
  it "should read the given template file from template path" do
    File.should_receive(:read).with(@generator.templates_path + 'template_file')
    @generator.move_template("template_file", "destination_file")
  end
  
  it "should write the given destination file to the gem path" do
    File.should_receive(:open).with("destination_path", 'w')
    @generator.move_template("template_file", "destination_path")    
  end
end

describe RStack::Generator, "#templates_path" do
  before(:each) do
    @generator = RStack::Generator.new("foo")
  end
  
  it "should be an instance of Pathname" do
    @generator.templates_path.should be_instance_of(Pathname)
  end
  
  it "should start with RSTACK_ROOT" do
    @generator.templates_path.to_s.should =~ /^#{RStack.root}.*$/
  end
  
  it "should exist" do
    File.exist?(@generator.templates_path).should be_true
  end
end

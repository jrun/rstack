require File.dirname(__FILE__) + '/spec_helper'

describe RStack::CoreExtensions::String, "#pathize" do
  it "should replace all dashses with slashes" do
    "foo-bar-jar".pathize.should == "foo/bar/jar"
  end
  
  it "should leave a string without dashes unchanged" do
    "foo/bar/jar".pathize.should == "foo/bar/jar"
  end
end
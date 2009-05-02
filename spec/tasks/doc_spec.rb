require File.dirname(__FILE__) + '/../spec_helper'

describe RStack::RDoc, 'defining a task' do
  before(:each) do
    @config = mock(:configuration).as_null_object
    @config.stub!(:to_str).and_return('')
    @task = RStack::RDoc.define_tasks @config
  end
  
  it "should define a valid template path" do
    @task.template.should exist
  end
end

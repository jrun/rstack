require '#{main.chomp('.rb')}'

module SpecHelper
  def null_mock(name, options = {})
    mock name, options.merge(:null_object => true)
  end
end

Spec::Runner.configure do |config|
  config.include(SpecHelper)
  
  # config.before(:each) do
  # end
end

module RStack #:nodoc:
  module CoreExtensions #:nodoc:
    module String
      def pathize
        self.gsub(/-/, '/')
      end
    end
  end
end

class String
  include RStack::CoreExtensions::String
end

class Pathname
  alias / +
end
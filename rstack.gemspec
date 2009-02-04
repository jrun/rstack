# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rstack}
  s.version = "0.5.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["jeremy burks"]
  s.date = %q{2008-11-30}
  s.default_executable = %q{rstack}
  s.email = %q{jeremy.burks@gmail.com}
  s.executables = ["rstack"]
  s.files = ["bin", "CHANGELOG.txt", "lib", "LICENSE.txt", "out", "pkg", "Rakefile", "README.textile", "spec", "templates", "vendor", "bin/rstack", "lib/rstack", "lib/rstack/configuration.rb", "lib/rstack/generator.rb", "lib/rstack/tasks", "lib/rstack/tasks/doc.rb", "lib/rstack/tasks/gem.rb", "lib/rstack/tasks/rspec.rb", "lib/rstack/version.rb", "lib/rstack.rb", "spec/configuration_spec.rb", "spec/generator_spec.rb", "spec/spec_helper.rb", "spec/tasks", "spec/tasks/doc_spec.rb", "templates/cruise_config.rb", "templates/main.rb", "templates/Rakefile", "templates/README.txt", "templates/spec_helper.rb", "templates/version.rb", "vendor/allison-2.0.2", "vendor/allison-2.0.2/allison.gemspec", "vendor/allison-2.0.2/bin", "vendor/allison-2.0.2/bin/allison", "vendor/allison-2.0.2/cache", "vendor/allison-2.0.2/cache/BODY", "vendor/allison-2.0.2/cache/CLASS_INDEX", "vendor/allison-2.0.2/cache/CLASS_PAGE", "vendor/allison-2.0.2/cache/FILE_INDEX", "vendor/allison-2.0.2/cache/FILE_PAGE", "vendor/allison-2.0.2/cache/FONTS", "vendor/allison-2.0.2/cache/FR_INDEX_BODY", "vendor/allison-2.0.2/cache/INDEX", "vendor/allison-2.0.2/cache/JAVASCRIPT", "vendor/allison-2.0.2/cache/METHOD_INDEX", "vendor/allison-2.0.2/cache/METHOD_LIST", "vendor/allison-2.0.2/cache/PROJECT", "vendor/allison-2.0.2/cache/SRC_PAGE", "vendor/allison-2.0.2/cache/STYLE", "vendor/allison-2.0.2/CHANGELOG", "vendor/allison-2.0.2/contrib", "vendor/allison-2.0.2/contrib/Rakefile", "vendor/allison-2.0.2/lib", "vendor/allison-2.0.2/lib/allison.css", "vendor/allison-2.0.2/lib/allison.js", "vendor/allison-2.0.2/lib/allison.rb", "vendor/allison-2.0.2/LICENSE", "vendor/allison-2.0.2/Manifest", "vendor/allison-2.0.2/README"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/jrun/rstack/wikis}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Provides a gem library generator and helpful rake tasks}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rake>, [">= 0.8.1"])
      s.add_runtime_dependency(%q<rcov>, [">= 0.8.0"])
      s.add_runtime_dependency(%q<diff-lcs>, [">= 1.1.2"])
      s.add_runtime_dependency(%q<rspec>, [">= 1.1.3"])
      s.add_runtime_dependency(%q<extlib>, [">= 0"])
    else
      s.add_dependency(%q<rake>, [">= 0.8.1"])
      s.add_dependency(%q<rcov>, [">= 0.8.0"])
      s.add_dependency(%q<diff-lcs>, [">= 1.1.2"])
      s.add_dependency(%q<rspec>, [">= 1.1.3"])
      s.add_dependency(%q<extlib>, [">= 0"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0.8.1"])
    s.add_dependency(%q<rcov>, [">= 0.8.0"])
    s.add_dependency(%q<diff-lcs>, [">= 1.1.2"])
    s.add_dependency(%q<rspec>, [">= 1.1.3"])
    s.add_dependency(%q<extlib>, [">= 0"])
  end
end
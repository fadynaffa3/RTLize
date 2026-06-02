require_relative 'lib/rtlize/version'

Gem::Specification.new do |s|
  s.name        = "rtlize-2"
  s.summary     = "Automatic CSS layout switcher (from LTR to RTL)"
  s.version     = Rtlize::VERSION
  s.authors     = ["Fady Naffa"]
  s.email       = ["fadynaffa3@gmail.com"]
  s.homepage    = "https://github.com/fadynaffa3/RTLize-2"

  s.executables = ['rtlize']
  s.files       = Dir["{app,bin,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.license     = "MIT"

  s.required_ruby_version = ">= 4.0.0"

  s.add_development_dependency "rails", ">= 7.0.0"
  s.add_development_dependency "sprockets-rails"
  s.add_development_dependency "sqlite3", ">= 1.4"
  s.add_development_dependency "simplecov"

  s.description = <<~END
    RTLize allows you to write your stylesheets for left-to-right (LTR) layouts
    and have them automatically work for right-to-left (RTL) layouts as well.
  END
end

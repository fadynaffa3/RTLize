source "https://rubygems.org"

# Declare your gem's dependencies in rtlize.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

rails_version = ENV["RAILS_VERSION"] || "7.1.0"

rails = case rails_version
when "master", "main"
  {:github => "rails/rails"}
else
  "~> #{rails_version}"
end

gem "rails", rails

# Rails 7.0 is incompatible with minitest 6 (changed run signature).
# Rails 7.1+ supports minitest 5.x which is what rails-test-unit expects.
gem "minitest", "~> 5.25"
gem "sassc"

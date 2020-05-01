lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "tomo/plugin/rollbar/version"

Gem::Specification.new do |spec|
  spec.name          = "tomo-plugin-rollbar"
  spec.version       = Tomo::Plugin::Rollbar::VERSION
  spec.authors       = ["Matt Brictson"]
  spec.email         = ["opensource@mattbrictson.com"]

  spec.summary       = "Provides rollbar tasks for tomo"
  spec.homepage      = "https://github.com/mattbrictson/tomo-plugin-rollbar"
  spec.license       = "MIT"

  spec.metadata = {
    "bug_tracker_uri" => "https://github.com/mattbrictson/tomo-plugin-rollbar/issues",
    "changelog_uri" => "https://github.com/mattbrictson/tomo-plugin-rollbar/releases",
    "homepage_uri" => "https://github.com/mattbrictson/tomo-plugin-rollbar",
    "source_code_uri" => "https://github.com/mattbrictson/tomo-plugin-rollbar"
  }

  # Specify which files should be added to the gem when it is released.
  spec.files = `git ls-files -z exe lib LICENSE.txt README.md`.split("\x0")
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.5.0"

  spec.add_dependency "tomo", "~> 1.0"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "minitest", "~> 5.11"
  spec.add_development_dependency "minitest-ci", "~> 3.4"
  spec.add_development_dependency "minitest-reporters", "~> 1.3"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rexml", "~> 3.2"
  spec.add_development_dependency "rubocop", "0.82.0"
  spec.add_development_dependency "rubocop-minitest", "0.9.0"
  spec.add_development_dependency "rubocop-performance", "1.5.2"
  spec.add_development_dependency "webmock", "~> 3.6"
end

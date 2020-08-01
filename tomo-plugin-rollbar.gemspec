require_relative "lib/tomo/plugin/rollbar/version"

Gem::Specification.new do |spec|
  spec.name = "tomo-plugin-rollbar"
  spec.version = Tomo::Plugin::Rollbar::VERSION
  spec.authors = ["Matt Brictson"]
  spec.email = ["opensource@mattbrictson.com"]

  spec.summary = "Provides rollbar tasks for tomo"
  spec.homepage = "https://github.com/mattbrictson/tomo-plugin-rollbar"
  spec.license = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.5.0")

  spec.metadata = {
    "bug_tracker_uri" => "https://github.com/mattbrictson/tomo-plugin-rollbar/issues",
    "changelog_uri" => "https://github.com/mattbrictson/tomo-plugin-rollbar/releases",
    "homepage_uri" => spec.homepage,
    "source_code_uri" => "https://github.com/mattbrictson/tomo-plugin-rollbar"
  }

  # Specify which files should be added to the gem when it is released.
  spec.files = `git ls-files -z exe lib LICENSE.txt README.md`.split("\x0")
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "tomo", "~> 1.0"
end

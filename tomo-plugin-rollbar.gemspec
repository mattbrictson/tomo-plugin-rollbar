require_relative "lib/tomo/plugin/rollbar/version"

Gem::Specification.new do |spec|
  spec.name = "tomo-plugin-rollbar"
  spec.version = Tomo::Plugin::Rollbar::VERSION
  spec.authors = ["Matt Brictson"]
  spec.email = ["opensource@mattbrictson.com"]

  spec.summary = "Provides rollbar tasks for tomo"
  spec.homepage = "https://github.com/mattbrictson/tomo-plugin-rollbar"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata = {
    "bug_tracker_uri" => "https://github.com/mattbrictson/tomo-plugin-rollbar/issues",
    "changelog_uri" => "https://github.com/mattbrictson/tomo-plugin-rollbar/releases",
    "homepage_uri" => spec.homepage,
    "source_code_uri" => "https://github.com/mattbrictson/tomo-plugin-rollbar",
    "rubygems_mfa_required" => "true"
  }

  # Specify which files should be added to the gem when it is released.
  spec.files = Dir.glob(%w[LICENSE.txt README.md {exe,lib}/**/*]).reject { |f| File.directory?(f) }
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "tomo", "~> 1.0"
end

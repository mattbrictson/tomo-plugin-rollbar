require_relative "tasks"
require_relative "version"

module Tomo::Plugin::Rollbar
  module Plugin
    extend Tomo::Plugin

    tasks Tomo::Plugin::Rollbar::Tasks

    defaults rollbar_env:   "%<environment>",
             rollbar_token: nil
  end
end

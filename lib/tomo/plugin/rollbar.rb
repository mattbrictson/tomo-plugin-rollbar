require "tomo"
require_relative "rollbar/tasks"
require_relative "rollbar/version"

module Tomo::Plugin
  module Rollbar
    extend Tomo::PluginDSL

    tasks Tomo::Plugin::Rollbar::Tasks

    defaults rollbar_env:   "%<environment>",
             rollbar_token: nil
  end
end

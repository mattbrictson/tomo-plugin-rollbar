require "tomo/plugin/rollbar"
require "tomo/testing"

class Tomo::Plugin::Rollbar::Test < Megatest::Test
end

Dir[File.expand_path("support/**/*.rb", __dir__)].each { |rb| require(rb) }

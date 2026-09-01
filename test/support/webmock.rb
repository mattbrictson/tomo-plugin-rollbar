# frozen_string_literal: true

require "webmock"

WebMock.enable!
WebMock::AssertionFailure.error_class = Megatest::Assertion

class Tomo::Plugin::Rollbar::Test
  include WebMock::API

  teardown do
    WebMock.reset!
  end
end

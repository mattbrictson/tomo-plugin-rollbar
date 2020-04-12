require "test_helper"

class Tomo::Plugin::Rollbar::TasksTest < Minitest::Test
  def setup
    @tester = Tomo::Testing::MockPluginTester.new(
      "rollbar",
      settings: {
        rollbar_env: "production",
        rollbar_token: "ABC123"
      },
      release: {
        deploy_user: "tester",
        revision: "65eda2149dd5ddb842024f281deef7d5a7f2ca6d"
      }
    )
  end

  def test_notify_deploy_sends_http_post
    stub_request(:post, "https://api.rollbar.com/api/1/deploy/")
      .with(body: {
              local_username: "tester",
              access_token:   "ABC123",
              environment:    "production",
              revision:       "65eda2149dd5ddb842024f281deef7d5a7f2ca6d"
            })
    @tester.run_task("rollbar:notify_deploy")
    assert_nil(@tester.executed_script)
    assert_match(/Rollbar notification complete/i, @tester.stdout)
  end

  def test_notify_deploy_raises_on_non_200_http_response
    stub_request(:post, "https://api.rollbar.com/api/1/deploy/")
      .to_return(status: 401)

    assert_raises(Tomo::Runtime::TaskAbortedError) do
      @tester.run_task("rollbar:notify_deploy")
    end
  end
end

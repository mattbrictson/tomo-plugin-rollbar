require "json"
require "net/http"
require "uri"

module Tomo::Plugin::Rollbar
  class Tasks < ::Tomo::TaskLibrary
    def notify_deploy
      require_settings :rollbar_env, :rollbar_token

      http_post(
        "https://api.rollbar.com/api/1/deploy/",
        local_username: remote.release[:deploy_user],
        access_token:   settings.fetch(:rollbar_token),
        environment:    settings.fetch(:rollbar_env),
        revision:       remote.release[:revision]
      )

      logger.info("Rollbar notification complete.")
    end

    private

    def http_post(url, params)
      uri = URI(url)
      request = Net::HTTP::Post.new(uri.request_uri)
      request.body = ::JSON.dump(params)

      logger.debug("Building Rollbar POST to #{uri} with #{params.inspect}")
      return if dry_run?

      response = Net::HTTP.start(uri.host, uri.port, :use_ssl => true) do |http|
        http.request(request)
      end
      handle_error(response)
    end

    def handle_error(response)
      return if response.is_a?(Net::HTTPSuccess)

      die("#{response.code} #{response.message}")
    end
  end
end

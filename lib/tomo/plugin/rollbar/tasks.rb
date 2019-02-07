require "json"
require "net/http"
require "uri"

module Tomo::Plugin::Rollbar
  class Tasks < ::Tomo::TaskLibrary
    def notify_deploy
      require_setting :rollbar_token

      uri    = URI.parse 'https://api.rollbar.com/api/1/deploy/'
      params = {
        :local_username => remote.release[:deploy_user],
        :access_token   => settings.fetch(:rollbar_token),
        :environment    => settings.fetch(:rollbar_env),
        :revision       => remote.release[:revision]
      }

      logger.debug "Building Rollbar POST to #{uri} with #{params.inspect}"

      request      = Net::HTTP::Post.new(uri.request_uri)
      request.body = ::JSON.dump(params)

      return if dry_run?

      Net::HTTP.start(uri.host, uri.port, :use_ssl => true) do |http|
        http.request(request)
      end

      # TODO: raise if request fails

      logger.info 'Rollbar notification complete.'
    end
  end
end

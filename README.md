# tomo-plugin-rollbar

[![Gem Version](https://img.shields.io/gem/v/tomo-plugin-rollbar)](https://rubygems.org/gems/tomo-plugin-rollbar)
[![Gem Downloads](https://img.shields.io/gem/dt/tomo-plugin-rollbar)](https://www.ruby-toolbox.com/projects/tomo-plugin-rollbar)
[![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/mattbrictson/tomo-plugin-rollbar/ci.yml)](https://github.com/mattbrictson/tomo-plugin-rollbar/actions/workflows/ci.yml)
[![Code Climate maintainability](https://img.shields.io/codeclimate/maintainability/mattbrictson/tomo-plugin-rollbar)](https://codeclimate.com/github/mattbrictson/tomo-plugin-rollbar)

This is a [tomo](https://github.com/mattbrictson/tomo) plugin that sends a notification to [Rollbar](https://rollbar.com) on a successful deploy.

---

- [Installation](#installation)
- [Settings](#settings)
- [Tasks](#tasks)
- [Support](#support)
- [License](#license)
- [Code of conduct](#code-of-conduct)
- [Contribution guide](#contribution-guide)


## Installation

Run:

```
$ gem install tomo-plugin-rollbar
```

Or add it to your Gemfile:

```ruby
gem "tomo-plugin-rollbar"
```

Then add the following to `.tomo/config.rb`:

```ruby
plugin "rollbar"

set rollbar_env: "production"
set rollbar_token: "YOUR_TOKEN_HERE"

deploy do
  # ...
  # Place this task at *end* of the deploy
  run "rollbar:notify_deploy"
end
```

If you are not comfortable storing the `rollbar_token` in the configuration file, you can alternatively provide it via a `TOMO_ROLLBAR_TOKEN` environment variable.

## Settings

| Name            | Purpose                                                                                         | Default |
| --------------- | ----------------------------------------------------------------------------------------------- | ------- |
| `rollbar_env`   | The environment being deployed, e.g. "production".                                              | `nil`   |
| `rollbar_token` | The Rollbar `post_server_item` project access token that will be used to post the notification. | `nil`   |

## Tasks

### rollbar:notify_deploy

Sends an HTTP POST notification to the Rollbar API describing the release that was successfully deployed. This includes the user who performed the deploy, the environment, the git revision.

Note that this task must run _after_ `git:create_release` in the deploy sequence in order to have access to the release information.

## Support

If you want to report a bug, or have ideas, feedback or questions about the gem, [let me know via GitHub issues](https://github.com/mattbrictson/tomo-plugin-rollbar/issues/new) and I will do my best to provide a helpful answer. Happy hacking!

## License

The gem is available as open source under the terms of the [MIT License](LICENSE.txt).

## Code of conduct

Everyone interacting in this project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](CODE_OF_CONDUCT.md).

## Contribution guide

Pull requests are welcome!

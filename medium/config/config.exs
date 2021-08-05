# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :medium,
  ecto_repos: [Medium.Repo]

# Configures the endpoint
config :medium, MediumWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "WPCVPh9S3u1+G1QO5b0IQKhK98D48gn4LTx6uh/A2lqAJ0IsF2DyjefeYwr5W95o",
  render_errors: [view: MediumWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Medium.PubSub,
  live_view: [signing_salt: "vZT5wtVA"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"


config :ueberauth, Ueberauth,
  providers: [
    google: {Ueberauth.Strategy.Google, [default_scope: "email profile"]},
    github: {Ueberauth.Strategy.Github, []}
  ]

config :ueberauth, Ueberauth.Strategy.Google.OAuth,
  client_id: "752093440540-4proo8ut7kmt6pl5sn8igo2o82o9jdub.apps.googleusercontent.com",
  client_secret: "hieK-IjeySQL9QlffOJ5aDOR",
  redirect_uri: "http://localhost:4000/auth/google/callback"

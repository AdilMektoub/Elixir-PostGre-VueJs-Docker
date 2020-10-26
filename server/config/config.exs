# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :theme01,
  ecto_repos: [Theme01.Repo]

# Configures the endpoint
config :theme01, Theme01Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "hLvtP8Tc9BKn1dN3pIJYAtedQuCNxUDOkY8HAAbVdrxsf8A3IMfaWahXLPvMgE3s",
  render_errors: [view: Theme01Web.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Theme01.PubSub,
  live_view: [signing_salt: "Ju1A6hu7"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

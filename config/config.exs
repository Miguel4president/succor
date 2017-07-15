# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :succor,
  ecto_repos: [Succor.Repo]

# Configures the endpoint
config :succor, Succor.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "8nOt6yfWVRiPlM4vUtuUTPqqmc6xI03qbMw6W0Zn2incD7FAUpeV14FdUjWVWys6",
  render_errors: [view: Succor.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Succor.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

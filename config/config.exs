# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :stat_dash_back,
  ecto_repos: [StatDashBack.Repo],
  generators: [timestamp_type: :utc_datetime]

# Configures the endpoint
config :stat_dash_back, StatDashBackWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [json: StatDashBackWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: StatDashBack.PubSub,
  live_view: [signing_salt: "4RxjC1NH"],
  origins: ["http://localhost:3000"]

config :stat_dash_back,
  riot_api_url_na: "https://na1.api.riotgames.com",
  riot_api_url_americas: "https://americas.api.riotgames.com",
  riot_api_key: System.get_env("RIOT_API_KEY", "RGAPI-245adf55-33e3-423f-8a1f-337569089e4b")

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :stat_dash_back, StatDashBack.Mailer, adapter: Swoosh.Adapters.Local

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.17.11",
  stat_dash_back: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configure tailwind (the version is required)
config :tailwind,
  version: "3.4.0",
  stat_dash_back: [
    args: ~w(
      --config=tailwind.config.js
      --input=css/app.css
      --output=../priv/static/assets/app.css
    ),
    cd: Path.expand("../assets", __DIR__)
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"

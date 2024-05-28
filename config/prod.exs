import Config

# Do not print debug messages in production

config :block_scout_web, BlockScoutWeb.Endpoint,
  http: [:inet6, port: System.get_env("PORT") || 4000],
  url: [host: "teraax.netlify.app", port: 80],
  cache_static_manifest: "priv/static/cache_manifest.json"

# Configura para usar SSL si es necesario
config :block_scout_web, BlockScoutWeb.Endpoint,
  force_ssl: [hsts: true]

config :logger, :console, level: :none

config :logger_json, :backend, level: :info

config :logger, :ecto,
  level: :info,
  path: Path.absname("logs/prod/ecto.log"),
  rotate: %{max_bytes: 52_428_800, keep: 19}

config :logger, :error,
  path: Path.absname("logs/prod/error.log"),
  rotate: %{max_bytes: 52_428_800, keep: 19}

config :logger, :account,
  level: :info,
  path: Path.absname("logs/prod/account.log"),
  rotate: %{max_bytes: 52_428_800, keep: 19},
  metadata_filter: [fetcher: :account]

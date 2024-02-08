defmodule StatDashBack.Repo do
  use Ecto.Repo,
    otp_app: :stat_dash_back,
    adapter: Ecto.Adapters.Postgres
end

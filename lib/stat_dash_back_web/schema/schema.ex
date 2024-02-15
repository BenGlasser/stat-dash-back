defmodule StatDashBackWeb.Schema do
  use Absinthe.Schema

  import_types StatDashBackWeb.Schema.Types.Summoner
  import_types StatDashBackWeb.Schema.Types.MatchHistory


  query do
    import_fields :summoner_queries
    import_fields :match_history_queries
  end

end

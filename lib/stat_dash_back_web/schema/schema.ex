defmodule StatDashBackWeb.Schema do
  use Absinthe.Schema

  import_types StatDashBackWeb.Schema.Types.Summoner


  query do
    import_fields :summoner_queries
  end

end

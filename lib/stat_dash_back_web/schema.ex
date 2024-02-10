defmodule StatDashBackWeb.Schema do
  use Absinthe.Schema

  alias StatDashBackWeb.Resolvers.Summoner

  @desc "A Summoner in the game League of Legends."
  object :summoner do
    field :id, :string
    field :account_id, :string
    field :puuid, :string
    field :name, :string
    field :profile_icon_id, :integer
    field :revision_date, :integer
    field :summoner_level, :integer
  end

  query do
    field :summoner, :summoner do
      arg :name, non_null(:string)

      resolve &Summoner.get_summoner_by_name/2
    end
  end
end

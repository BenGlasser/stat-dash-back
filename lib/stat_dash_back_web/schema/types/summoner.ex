defmodule StatDashBackWeb.Schema.Types.Summoner do
  use Absinthe.Schema.Notation
  alias StatDashBackWeb.Resolvers.Summoner

  @desc "A Summoner in League of Legends."
  object :summoner do
    field :name, :string
    field :rank, :string
    field :tier, :string
    field :profile_icon_id, :integer
    field :level, :integer
    field :mastery_score, :integer
    field :puuid, :string
  end

  object :summoner_queries do
    field :summoner, :summoner do
      arg :name, non_null(:string)

      resolve &Summoner.get_summoner_by_name/2
    end
  end
end

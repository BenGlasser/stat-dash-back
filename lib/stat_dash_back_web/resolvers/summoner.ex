defmodule StatDashBackWeb.Resolvers.Summoner do
  alias StatDashBack.RiotClient.ChampionMasteryV4
  alias StatDashBack.RiotClient.LeagueV4
  alias StatDashBack.RiotClient.SummonerV4
  alias StatDashBack.RiotClient.DTO.SummonerDto
  alias StatDashBack.RiotClient.DTO.LeagueEntryDto

  def get_summoner_by_name(%{name: name}, _ctx) do
    with {:ok, %SummonerDto{} = summoner} <- SummonerV4.get_summoner_by_name(name),
         {:ok, [%LeagueEntryDto{} = league_entry | _]} <- LeagueV4.get_summoner_league_entries(summoner.id),
         {:ok, mastery_score} <- ChampionMasteryV4.get_mastery_score_by_puuid(summoner.puuid) do
          {:ok, %{
            name: league_entry.summoner_name,
            level: summoner.summoner_level,
            rank: league_entry.rank,
            tier: league_entry.tier,
            profile_icon_id: summoner.profile_icon_id,
            mastery_score: mastery_score
          }}
    else
      {:ok, []} ->
        {:error, "No league found for summoner"}

      {:error, reason} ->
        {:error, reason}
    end
  end

  @spec get_summoner_league(any()) ::
          {:error, any()} | {:ok, LeagueEntryDto.t()}
  def get_summoner_league(summoner_id) do
    case LeagueV4.get_summoner_league_entries(summoner_id) do
      {:ok, %LeagueEntryDto{} = league} ->
        {:ok, league}

      {:error, reason} ->
        {:error, reason}
    end
  end
end

defmodule StatDashBackWeb.Resolvers.Summoner do
  alias StatDashBack.RiotClient.ChampionMasteryV4
  alias StatDashBack.RiotClient.LeagueV4
  alias StatDashBack.RiotClient.SummonerV4
  alias StatDashBack.RiotClient.DTO.SummonerDTO
  alias StatDashBack.RiotClient.DTO.LeagueEntryDTO
  alias StatDashBack.RiotClient.DTO.MiniSeriesDTO

  def get_summoner_by_name(%{name: name}, _ctx) do
    with {:ok, %SummonerDTO{} = summoner} <- SummonerV4.get_summoner_by_name(name),
         {:ok, [%LeagueEntryDTO{} = league_entry | _]} <- LeagueV4.get_summoner_league_entries(summoner.id),
         {:ok, mastery_score} <- ChampionMasteryV4.get_mastery_score_by_puuid(summoner.puuid) do
          {:ok, %{
            name: league_entry.summoner_name,
            level: summoner.summoner_level,
            rank: "#{league_entry.tier} #{league_entry.rank}",
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
          {:error, any()} | {:ok, StatDashBack.RiotClient.DTO.LeagueEntryDTO.t()}
  def get_summoner_league(summoner_id) do
    case LeagueV4.get_summoner_league_entries(summoner_id) do
      {:ok, %LeagueEntryDTO{} = league} ->
        {:ok, league}

      {:error, reason} ->
        {:error, reason}
    end
  end

  def get_summoner_mastery(summoner_id) do
    case SummonerV4.get_summoner_mastery(summoner_id) do
      {:ok, mastery} ->
        {:ok, mastery}

      {:error, reason} ->
        {:error, reason}
    end
  end

  def get_summoner_mini_series(league_id, summoner_id) do
    case SummonerV4.get_summoner_mini_series(league_id, summoner_id) do
      {:ok, %MiniSeriesDTO{} = mini_series} ->
        {:ok, mini_series}

      {:error, reason} ->
        {:error, reason}
    end
  end
end

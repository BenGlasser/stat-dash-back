defmodule StatDashBackWeb.Resolvers.Summoner do
  alias StatDashBack.RiotClient.SummonerV4
  alias StatDashBack.RiotClient.DTO.Summoner
  alias StatDashBack.RiotClient.DTO.LeagueEntryDTO
  alias StatDashBack.RiotClient.DTO.MiniSeriesDTO

  def get_summoner_by_name(%{name: name}, _ctx) do
    case SummonerV4.get_summoner_by_name(name) do
      {:ok, %Summoner{} = summoner} ->
        {:ok, summoner}

      {:error, reason} ->
        {:error, reason}
    end
  end

  def get_summoner_league(summoner_id) do
    case SummonerV4.get_summoner_league(summoner_id) do
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

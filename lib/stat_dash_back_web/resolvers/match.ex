defmodule StatDashBackWeb.Resolvers.Match do
  alias StatDashBack.RiotClient.MatchV5
  alias StatDashBack.RiotClient.DTO.MatchDto
  alias StatDashBack.RiotClient.SummonerV4

  def get_history(%{puuid: nil, name: nil}, _), do: {:error, "No puuid or name provided"}

  def get_history(%{puuid: puuid, name: nil}, _), do: get_history(:puuid, puuid)

  def get_history(%{puuid: nil, name: name}, _), do: get_history(:name, name)

  def get_history(%{puuid: puuid}, _), do: get_history(:puuid, puuid)

  def get_history(%{name: name}, _), do: get_history(:name, name)

  def get_history(:puuid, puuid) do
    with {:ok, match_ids} <- MatchV5.get_match_ids_by_puuid(puuid),
      {:ok, matches} <- MatchV5.get_matches_by_ids(match_ids)do
      {:ok, matches}
    else
      {:error, reason} ->
        {:error, reason}
    end
  end

  def get_history(:name, name) do
    case SummonerV4.get_summoner_by_name(name) do
      {:ok, %{puuid: puuid}} ->
        get_history(:puuid, puuid)

      {:error, reason} ->
        {:error, reason}

    end
  end

  def get_match(%{id: id}, _) do
    with {:ok, %MatchDto{} = match} <- MatchV5.get_match_by_id(id) do
      {:ok, match}
    else
      {:error, reason} ->
        {:error, reason}
    end
  end
end

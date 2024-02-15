defmodule StatDashBack.RiotClient.LeagueV4 do
  alias StatDashBack.RiotClient.DTO.LeagueEntryDto

  use StatDashBack.RiotClient.Base

  @entries_by_summoner_id_url "/lol/league/v4/entries/by-summoner"

  def get_summoner_league_entries(encrypted_summoner_id) do
    url = @entries_by_summoner_id_url <> "/#{encrypted_summoner_id}"

    case __MODULE__.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body
        |> Poison.decode!
        |> Enum.map(&LeagueEntryDto.from_map/1)
        |> ok

      # catch non-200 status codes
      {:ok, %HTTPoison.Response{status_code: _status_code, body: body}} ->
        {:error, Poison.decode!(body)}

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end
end

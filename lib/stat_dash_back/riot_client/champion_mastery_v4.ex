defmodule StatDashBack.RiotClient.ChampionMasteryV4 do
  use StatDashBack.RiotClient.Base

  alias StatDashBack.RiotClient.DTO.ChampionMasteryDTO

  @champion_mastery_by_puuid_url "/lol/champion-mastery/v4/champion-masteries/by-puuid"
  @mastery_score_by_puuid "/lol/champion-mastery/v4/scores/by-puuid"

  def get_mastery_score_by_puuid(puuid) do
    url = @mastery_score_by_puuid <> "/#{puuid}"

    case __MODULE__.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, Poison.decode!(body)}

      # catch non-200 status codes
      {:ok, %HTTPoison.Response{status_code: _status_code, body: body}} ->
        {:error, Poison.decode!(body)}

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end
end

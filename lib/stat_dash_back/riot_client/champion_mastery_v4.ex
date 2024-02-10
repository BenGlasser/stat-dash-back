defmodule StatDashBack.RiotClient.ChampionMasteryV4 do
  use StatDashBack.RiotClient.Base

  alias StatDashBack.RiotClient.DTO.ChampionMasteryDTO

  @champion_mastery_by_puuid_url "/lol/champion-mastery/v4/champion-masteries/by-puuid"

  def get_champion_mastery_by_puuid(puuid) do
    url = @champion_mastery_by_puuid_url <> "/#{puuid}"

    case __MODULE__.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, Poison.decode!(body)}

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end
end

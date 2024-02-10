defmodule StatDashBack.RiotClient.SummonerV4 do
  use StatDashBack.RiotClient.Base

  alias StatDashBack.RiotClient.DTO.Summoner

  @summoner_by_name_url "/lol/summoner/v4/summoners/by-name"

  def get_summoner_by_name(name) do
    url = @summoner_by_name_url <> "/#{name}"

    with {:ok, %HTTPoison.Response{status_code: 200, body: body}} <- __MODULE__.get(url),
         {:decode, summoner} <- {:decode, Poison.decode!(body)},
         {:translate, %Summoner{} = summoner} <- {:translate, Summoner.from_map(summoner)} do
      {:ok, summoner}
    else
      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}

      {:translate, error} ->
        {:error, error}
    end
  end
end

defmodule StatDashBack.RiotClient.SummonerV4 do
  use StatDashBack.RiotClient.Base

  alias StatDashBack.RiotClient.DTO.SummonerDTO

  @summoner_by_name_url "/lol/summoner/v4/summoners/by-name"

  def get_summoner_by_name(name) do
    url = @summoner_by_name_url <> "/#{name}"

    case __MODULE__.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}}  ->
        body
        |> Poison.decode!
        |> SummonerDTO.from_map
        |> ok

      {:ok, %HTTPoison.Response{status_code: 404, body: body}} ->
        message = Poison.decode!(body) |> Map.get("status") |> Map.get("message")
        {:error, message}

      {:ok, %HTTPoison.Response{status_code: 403, body: body}} ->
        message = Poison.decode!(body) |> Map.get("status") |> Map.get("message")
        {:error, message <> "Could not find #{name} (refresh your API key)"}

      # catch non-200 status codes
      {:ok, %HTTPoison.Response{status_code: _status_code, body: body}} ->
        {:error, Poison.decode!(body)}

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end
end

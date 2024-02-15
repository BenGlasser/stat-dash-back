defmodule StatDashBack.RiotClient.MatchV5 do
  @moduledoc """
  Module for interfacing with the match_v5 LOL API.
  """

  use StatDashBack.RiotClient.Base, region: :americas

  @match_ids_by_puuid_url "/lol/match/v5/matches/by-puuid"
  @match_by_match_id_url "/lol/match/v5/matches"

  @doc """
  Get match ids by puuid

  ## Examples

      iex> StatDashBack.RiotClient.MatchV5.get_match_ids_by_puuid("puuid")
      {:ok, ["match_id1", "match_id2", "match_id3"]}

      iex> StatDashBack.RiotClient.MatchV5.get_match_ids_by_puuid("puuid", [startTime: 1707933161])
      {:ok, ["match_id1", "match_id2", "match_id3"]}

      opts are a keyword list with the following options:
        - startTime: Integer.t()
          - Epoch timestamp in seconds. The matchlist started storing timestamps on June 16th, 2021. Any matches played before June 16th, 2021 won't be included in the results if the startTime filter is set.
        - endTime: Integer.t()
          -	Epoch timestamp in seconds.
        - queue: Integer.t()
          - Filter the list of match ids by a specific queue id. This filter is mutually inclusive of the type filter meaning any match ids returned must match both the queue and type filters.
        - type: String.t()
          - Filter the list of match ids by the type of match. This filter is mutually inclusive of the queue filter meaning any match ids returned must match both the queue and type filters.
        - start: Integer.t()
          - Defaults to 0. Start index.
        - count: Integer.t()
          -Defaults to 20. Valid values: 0 to 100. Number of match ids to return.
  """
  @spec get_match_ids_by_puuid(String.t()) :: {:error, Map.t() | String.t()} | {:ok, List.t()}
  def get_match_ids_by_puuid(puuid, opts \\ []) do
    url = get_match_ids_by_puuid_url(puuid) |> IO.inspect

    query_string = get_opts(opts)
    url = url <> query_string

    case __MODULE__.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body
        |> Poison.decode!
        |> ok

      # catch non-200 status codes
      {:ok, %HTTPoison.Response{status_code: _status_code, body: body}} ->
        {:error, Poison.decode!(body)}

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end

  def get_match_by_match_id(match_id) do
    url = @match_by_match_id_url <> "/#{match_id}"

    case __MODULE__.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        body
        |> Poison.decode!
        |> ok

      # catch non-200 status codes
      {:ok, %HTTPoison.Response{status_code: _status_code, body: body}} ->
        {:error, Poison.decode!(body)}

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end

  defp get_opts([]), do: ""
  defp get_opts(opts) do
    "?" <> opts
    |> Enum.map(fn {k, v} -> "#{k}=#{v}" end)
    |> Enum.join("&")
  end

  defp get_match_ids_by_puuid_url(puuid), do: @match_ids_by_puuid_url <> "/#{puuid}" <> "/ids"
end

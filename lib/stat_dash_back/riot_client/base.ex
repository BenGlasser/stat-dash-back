defmodule StatDashBack.RiotClient.Base do
  @moduledoc """
  This is the base module responsible for making requests to the Riot API.
  """


  @riot_base_url_na1 "https://na1.api.riotgames.com"
  @riot_base_url_americas "https://americas.api.riotgames.com"

  defmacro __using__(opts \\ []) do
    quote do
      use HTTPoison.Base
      @riot_api_key Application.compile_env(:riot_client, :api_key)

      unquote(config(opts))

      def process_request_url(url) do
        @riot_base_url <> url
      end

      def process_request_headers(_headers) do
        [
          {"X-Riot-Token", @riot_api_key}
        ]
      end

      def ok(term) do
        {:ok, term}
      end
    end
  end

  defp config([]) do
    quote do
      @riot_base_url unquote(@riot_base_url_na1)
    end
  end

  defp config([region: region]) do
    quote do
      cond do
        unquote(region) == :na1 -> @riot_base_url unquote(@riot_base_url_na1)
        unquote(region) == :americas -> @riot_base_url unquote(@riot_base_url_americas)
        true ->  @riot_base_url unquote(@riot_base_url_na1)
      end
    end
  end
end

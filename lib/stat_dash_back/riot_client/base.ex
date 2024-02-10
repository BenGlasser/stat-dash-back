defmodule StatDashBack.RiotClient.Base do
  @moduledoc """
  This is the base module responsible for making requests to the Riot API.
  """
  defmacro __using__(_) do
    quote do
      use HTTPoison.Base

      @riot_base_url "https://na1.api.riotgames.com"
      @riot_api_key "RGAPI-81244ccc-867f-421e-a541-bdd248621248"

      def process_request_url(url) do
        @riot_base_url <> url
      end

      def process_request_headers(_headers) do
        [
          {"X-Riot-Token", @riot_api_key}
        ]
      end
    end
  end
end

defmodule StatDashBack.RiotClient.DTO.SummonerDto do
  @moduledoc """
  This module defines the Summoner struct and related types.
  """
  defstruct [
    :id,
    :account_id,
    :puuid,
    :name,
    :profile_icon_id,
    :revision_date,
    :summoner_level

  ]

  @typedoc """
  The Summoner struct represents a player's summoner information.
  """
  @type summoner :: %__MODULE__{
          # Encrypted summoner ID. Max length 63 characters.
          id: String.t(),
          # Encrypted account ID. Max length 56 characters.
          account_id: String.t(),
          # ID of the summoner icon associated with the summoner.
          profile_icon_id: Integer.t(),
          # Date summoner was last modified specified as epoch milliseconds. The following events will update this timestamp: summoner name change, summoner level change, or profile icon change.
          revision_date: Integer.t(),
          # Summoner name.
          name: String.t(),
          # Encrypted PUUID. Exact length of 78 characters.
          puuid: String.t(),
          # Summoner level associated with the summoner.
          summoner_level: Integer.t()
        }

  def from_map(%{} = summoner) do
    %__MODULE__{
      id: Map.get(summoner, :id, Map.get(summoner, "id", "")),
      account_id: Map.get(summoner, :account_id, Map.get(summoner, "accountId", "")),
      puuid: Map.get(summoner, :puuid, Map.get(summoner, "puuid", "")),
      name: Map.get(summoner, :name, Map.get(summoner, "name", "")),
      profile_icon_id: Map.get(summoner, :profile_icon_id, Map.get(summoner, "profileIconId", 0)),
      revision_date: Map.get(summoner, :revision_date, Map.get(summoner, "revisionDate", 0)),
      summoner_level: Map.get(summoner, :summoner_level, Map.get(summoner, "summonerLevel", 0)),
    }
  end
end

defmodule StatDashBack.RiotClient.DTO.Summoner do
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

  def from_map(%{
        "id" => id,
        "accountId" => account_id,
        "puuid" => puuid,
        "name" => name,
        "profileIconId" => profile_icon_id,
        "revisionDate" => revision_date,
        "summonerLevel" => summoner_level
      }) do
    %__MODULE__{
      id: id,
      account_id: account_id,
      puuid: puuid,
      name: name,
      profile_icon_id: profile_icon_id,
      revision_date: revision_date,
      summoner_level: summoner_level
    }
  end
end

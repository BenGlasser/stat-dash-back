defmodule StatDashBack.RiotClient.DTO.ChampionMasteryDTO do
  defstruct [
    :puuid,
    :championPointsUntilNextLevel,
    :chestGranted,
    :championId,
    :lastPlayTime,
    :championLevel,
    :summonerId,
    :championPoints,
    :championPointsSinceLastLevel,
    :tokensEarned
  ]

  @typedoc """
  The ChampionMasteryDTO struct represents a player's champion mastery information.
  """
  @type t :: %__MODULE__{
          # Player Universal Unique Identifier. Exact length of 78 characters. (Encrypted)
          puuid: String.t(),
          # Number of points needed to achieve next level. Zero if player reached maximum champion level for this champion.
          championPointsUntilNextLevel: Integer.t(),
          # Is chest granted for this champion or not in current season.
          chestGranted: Boolean.t(),
          # Champion ID for this entry.
          championId: Integer.t(),
          # Last time this champion was played by this player - in Unix milliseconds time format.
          lastPlayTime: Integer.t(),
          # Champion level for specified player and champion combination.
          championLevel: Integer.t(),
          # Summoner ID for this entry. (Encrypted)
          summonerId: String.t(),
          # Total number of champion points for this player and champion combination - they are used to determine championLevel.
          championPoints: Integer.t(),
          # Number of points earned since current level has been achieved.
          championPointsSinceLastLevel: Integer.t(),
          # The token earned for this champion at the current championLevel. When the championLevel is advanced the tokensEarned resets to 0.
          tokensEarned: Integer.t()
        }

  def from_map(%{
        "puuid" => puuid,
        "championPointsUntilNextLevel" => championPointsUntilNextLevel,
        "chestGranted" => chestGranted,
        "championId" => championId,
        "lastPlayTime" => lastPlayTime,
        "championLevel" => championLevel,
        "summonerId" => summonerId,
        "championPoints" => championPoints,
        "championPointsSinceLastLevel" => championPointsSinceLastLevel,
        "tokensEarned" => tokensEarned
      }) do
    %__MODULE__{
      puuid: puuid,
      championPointsUntilNextLevel: championPointsUntilNextLevel,
      chestGranted: chestGranted,
      championId: championId,
      lastPlayTime: lastPlayTime,
      championLevel: championLevel,
      summonerId: summonerId,
      championPoints: championPoints,
      championPointsSinceLastLevel: championPointsSinceLastLevel,
      tokensEarned: tokensEarned
    }
  end
end

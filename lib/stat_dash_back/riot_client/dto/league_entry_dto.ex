defmodule StatDashBack.RiotClient.DTO.LeagueEntryDto do

  alias StatDashBack.RiotClient.DTO.MiniSeriesDto

  defstruct [
    :league_id,
    :summoner_id,
    :summoner_name,
    :queue_type,
    :tier,
    :rank,
    :league_points,
    :wins,
    :losses,
    :hot_streak,
    :veteran,
    :fresh_blood,
    :inactive,
    :mini_series
  ]

  @type t :: %__MODULE__{
          league_id: String.t(),
          # Player's encrypted summonerId.
          summoner_id: String.t(),
          summoner_name: String.t(),
          queue_type: String.t(),
          tier: String.t(),
          # The player's division within a tier.
          rank: String.t(),
          league_points: Integer.t(),
          # Winning team on Summoners Rift.
          wins: Integer.t(),
          # Losing team on Summoners Rift.
          losses: Integer.t(),
          hot_streak: Boolean.t(),
          veteran: Boolean.t(),
          fresh_blood: Boolean.t(),
          inactive: Boolean.t(),
          mini_series: MiniSeriesDto.t()
        }

  def from_map(%{} = league_entry) do
    %__MODULE__{
      league_id: Map.get(league_entry, :league_id, Map.get(league_entry, "leagueId")),
      summoner_id: Map.get(league_entry, :summoner_id, Map.get(league_entry, "summonerId")),
      summoner_name: Map.get(league_entry, :summoner_name, Map.get(league_entry, "summonerName")),
      queue_type: Map.get(league_entry, :queue_type, Map.get(league_entry, "queueType")),
      tier: Map.get(league_entry, :tier, Map.get(league_entry, "tier")),
      rank: Map.get(league_entry, :rank, Map.get(league_entry, "rank")),
      league_points: Map.get(league_entry, :league_points, Map.get(league_entry, "leaguePoints")),
      wins: Map.get(league_entry, :wins, Map.get(league_entry, "wins")),
      losses: Map.get(league_entry, :losses, Map.get(league_entry, "losses")),
      hot_streak: Map.get(league_entry, :hot_streak, Map.get(league_entry, "hotStreak")),
      veteran: Map.get(league_entry, :veteran, Map.get(league_entry, "veteran")),
      fresh_blood: Map.get(league_entry, :fresh_blood, Map.get(league_entry, "freshBlood")),
      inactive: Map.get(league_entry, :inactive, Map.get(league_entry, "inactive")),
      mini_series: Map.get(league_entry, :mini_series, Map.get(league_entry, "miniSeries", [])) |> Enum.map(&MiniSeriesDto.from_map/1)
    }
  end
end

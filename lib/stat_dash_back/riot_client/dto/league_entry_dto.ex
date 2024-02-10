defmodule StatDashBack.RiotClient.DTO.LeagueEntryDTO do
  defstruct [
    :leagueId,
    :summonerId,
    :summonerName,
    :queueType,
    :tier,
    :rank,
    :leaguePoints,
    :wins,
    :losses,
    :hotStreak,
    :veteran,
    :freshBlood,
    :inactive,
    :miniSeries
  ]

  @type t :: %__MODULE__{
          leagueId: String.t(),
          # Player's encrypted summonerId.
          summonerId: String.t(),
          summonerName: String.t(),
          queueType: String.t(),
          tier: String.t(),
          # The player's division within a tier.
          rank: String.t(),
          leaguePoints: Integer.t(),
          # Winning team on Summoners Rift.
          wins: Integer.t(),
          # Losing team on Summoners Rift.
          losses: Integer.t(),
          hotStreak: Boolean.t(),
          veteran: Boolean.t(),
          freshBlood: Boolean.t(),
          inactive: Boolean.t(),
          miniSeries: StatDashBack.RiotClient.DTO.MiniSeriesDTO.t()
        }

  def from_map(%{
        "leagueId" => leagueId,
        "summonerId" => summonerId,
        "summonerName" => summonerName,
        "queueType" => queueType,
        "tier" => tier,
        "rank" => rank,
        "leaguePoints" => leaguePoints,
        "wins" => wins,
        "losses" => losses,
        "hotStreak" => hotStreak,
        "veteran" => veteran,
        "freshBlood" => freshBlood,
        "inactive" => inactive,
        "miniSeries" => miniSeries
      }) do
    %__MODULE__{
      leagueId: leagueId,
      summonerId: summonerId,
      summonerName: summonerName,
      queueType: queueType,
      tier: tier,
      rank: rank,
      leaguePoints: leaguePoints,
      wins: wins,
      losses: losses,
      hotStreak: hotStreak,
      veteran: veteran,
      freshBlood: freshBlood,
      inactive: inactive,
      miniSeries: StatDashBack.RiotClient.DTO.MiniSeriesDTO.from_map(miniSeries)
    }
  end
end

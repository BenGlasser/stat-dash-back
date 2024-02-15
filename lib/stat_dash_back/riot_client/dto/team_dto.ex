defmodule StatDashBack.RiotClient.DTO.TeamDto do

  alias StatDashBack.RiotClient.DTO.ObjectivesDto
  alias StatDashBack.RiotClient.DTO.BanDto

  defstruct [
    :bans,
    :objectives,
    :team_id,
    :win
  ]

  @type t :: %__MODULE__{
    bans: [BanDto.t()],
    objectives: ObjectivesDto.t(),
    team_id: integer(),
    win: String.t()
  }

  def from_map(%{} = team) do
    %__MODULE__{
      bans: Map.get(team, :bans, Map.get(team, "bans", [])) |> Enum.map(&BanDto.from_map/1),
      objectives: Map.get(team, :objectives, Map.get(team, "objectives")) |> ObjectivesDto.from_map(),
      team_id: Map.get(team, :teamId, Map.get(team, "teamId")),
      win: Map.get(team, :win, Map.get(team, "win"))
    }
  end
end

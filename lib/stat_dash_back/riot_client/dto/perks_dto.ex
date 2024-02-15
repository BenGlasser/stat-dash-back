defmodule StatDashBack.RiotClient.DTO.PerksDto do

  alias StatDashBack.RiotClient.DTO.PerkStyleDto
  alias StatDashBack.RiotClient.DTO.PerkStatsDto

  defstruct [
    :statPerks,
    :styles
  ]

  @type t :: %__MODULE__{
          statPerks: PerkStatsDto.t(),
          styles: [PerkStyleDto.t()]
        }

  def from_map(%{} = perks) do
    %__MODULE__{
      statPerks: Map.get(perks, :statPerks, Map.get(perks, "statPerks", %PerkStatsDto{})) |> PerkStatsDto.from_map(),
      styles: Map.get(perks, :styles, Map.get(perks, "styles", [])) |> Enum.map(&PerkStyleDto.from_map/1)
    }
  end
end

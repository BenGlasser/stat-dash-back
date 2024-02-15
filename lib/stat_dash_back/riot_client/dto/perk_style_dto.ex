defmodule StatDashBack.RiotClient.DTO.PerkStyleDto do
  @moduledoc """
  Documentation for PerkStyleDto.
  """

  alias StatDashBack.RiotClient.DTO.PerkStyleSelectionDto

  defstruct [:description, :selections, :style]


  @type t :: %__MODULE__{
          description: String.t(),
          selections: [PerkStyleSelectionDto.t()],
          style: Integer.t()
        }

  def from_map(%{} = perk_style) do
    %__MODULE__{
      description: Map.get(perk_style, :description, Map.get(perk_style, "description")),
      selections: Map.get(perk_style, :selections, Map.get(perk_style, "selections", [])) |> Enum.map(&PerkStyleSelectionDto.from_map/1),
      style: Map.get(perk_style, :style, Map.get(perk_style, "style"))
    }
  end
end

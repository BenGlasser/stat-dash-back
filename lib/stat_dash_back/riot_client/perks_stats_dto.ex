defmodule StatDashBack.RiotClient.DTO.PerksStatsDto do
  @moduledoc """
  Documentation for PerksStatsDto.
  """

  defstruct [
    :defense,
    :flex,
    :offense
  ]

  @type t :: %__MODULE__{
    defense: integer(),
    flex: integer(),
    offense: integer()
  }

  def from_map(%{} = perk_stats) do
    %__MODULE__{
      defense: Map.get(perk_stats, :defense, Map.get(perk_stats, "defense")),
      flex: Map.get(perk_stats, :flex, Map.get(perk_stats, "flex")),
      offense: Map.get(perk_stats, :offense, Map.get(perk_stats, "offense"))
    }
  end
end

defmodule StatDashBack.RiotClient.DTO.ObjectivesDto do
  @moduledoc """
  Documentation for ObjectivesDto.
  """

  alias StatDashBack.RiotClient.DTO.ObjectiveDto
  defstruct [
    :baron,
    :champion,
    :dragon,
    :inhibitor,
    :rift_herald,
    :tower
  ]

  @type t :: %__MODULE__{
    baron: ObjectiveDto.t(),
    champion: ObjectiveDto.t(),
    dragon: ObjectiveDto.t(),
    inhibitor: ObjectiveDto.t(),
    rift_herald: ObjectiveDto.t(),
    tower: ObjectiveDto.t()
  }

  def from_map(%{} = objectives) do
    %__MODULE__{
      baron: Map.get(objectives, :baron, Map.get(objectives, "baron")) |> ObjectiveDto.from_map(),
      champion: Map.get(objectives, :champion, Map.get(objectives, "champion")) |> ObjectiveDto.from_map(),
      dragon: Map.get(objectives, :dragon, Map.get(objectives, "dragon")) |> ObjectiveDto.from_map(),
      inhibitor: Map.get(objectives, :inhibitor, Map.get(objectives, "inhibitor")) |> ObjectiveDto.from_map(),
      rift_herald: Map.get(objectives, :riftHerald, Map.get(objectives, "riftHerald")) |> ObjectiveDto.from_map(),
      tower: Map.get(objectives, :tower, Map.get(objectives, "tower")) |> ObjectiveDto.from_map()
    }
  end
end

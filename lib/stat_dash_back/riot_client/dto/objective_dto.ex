defmodule StatDashBack.RiotClient.DTO.ObjectiveDto do
  @moduledoc """
  Documentation for ObjectiveDto.
  """

  defstruct [
    :first,
    :kills
  ]

  @type t :: %__MODULE__{
    first: boolean(),
    kills: integer()
  }

  def from_map(%{} = objective) do
    %__MODULE__{
      first: Map.get(objective, :first, Map.get(objective, "first")),
      kills: Map.get(objective, :kills, Map.get(objective, "kills"))
    }
  end
end

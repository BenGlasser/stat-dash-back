defmodule StatDashBack.RiotClient.DTO.BanDto do
  @moduledoc """
  Documentation for BanDto module.
  """

  defstruct [:champion_id, :pick_turn]

  @type t :: %__MODULE__{
          champion_id: integer(),
          pick_turn: integer()
        }

  def from_map(%{} = ban) do
    %__MODULE__{
      champion_id: Map.get(ban, :championId, Map.get(ban, "championId")),
      pick_turn: Map.get(ban, :pickTurn, Map.get(ban, "pickTurn"))
    }
  end
end

defmodule StatDashBack.RiotClient.DTO.MatchDto do
  @moduledoc """
  Documentation for MatchDto.
  """
  alias StatDashBack.RiotClient.DTO.MetadataDto
  alias StatDashBack.RiotClient.DTO.InfoDto

  defstruct [
    :metadata,
    :info
  ]

  @type t :: %__MODULE__{
    metadata: MetadataDto.t(),
    info: InfoDto.t()
  }

  def from_map(%{} = match) do
    %__MODULE__{
      metadata: Map.get(match, :metadata, Map.get(match, "metadata", %MetadataDto{})) |> MetadataDto.from_map(),
      info: Map.get(match, :info, Map.get(match, "info", %InfoDto{})) |> InfoDto.from_map()
    }
  end
end

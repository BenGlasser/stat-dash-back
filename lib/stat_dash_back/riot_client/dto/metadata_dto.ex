defmodule StatDashBack.RiotClient.DTO.MetadataDto do

  alias StatDashBack.RiotClient.DTO.ParticipantDto

  defstruct [
    :data_version,
    :match_id,
    :participants
  ]

  @type t :: %__MODULE__{
          data_version: String.t(),
          match_id: String.t(),
          participants: [ParticipantDto.t()]
        }

  def from_map(%{} = metadata) do
    %__MODULE__{
      data_version: Map.get(metadata, :data_version, Map.get(metadata, "data_version")),
      match_id: Map.get(metadata, :match_id, Map.get(metadata, "match_id")),
      participants: Map.get(metadata, :participants, Map.get(metadata, "participants", [])) |> Enum.map(&ParticipantDto.from_map/1)
    }
  end
end

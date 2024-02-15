defmodule StatDashBack.RiotClient.DTO.MetadataDto do

  defstruct [
    :data_version,
    :match_id,
    :participants
  ]

  @type t :: %__MODULE__{
          data_version: String.t(),
          match_id: String.t(),
          participants: [String.t()]
        }

  def from_map(%{} = metadata) do
    %__MODULE__{
      data_version: Map.get(metadata, :data_version, Map.get(metadata, "dataVersion")),
      match_id: Map.get(metadata, :match_id, Map.get(metadata, "matchId")),
      participants: Map.get(metadata, :participants, Map.get(metadata, "participants", []))
    }
  end
end

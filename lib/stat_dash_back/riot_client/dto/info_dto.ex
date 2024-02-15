defmodule   StatDashBack.RiotClient.DTO.InfoDto do
  @moduledoc """
  This module is responsible for defining the InfoDto struct and its functions.
  """
  alias StatDashBack.RiotClient.DTO.ParticipantDto
  alias StatDashBack.RiotClient.DTO.TeamDto

  defstruct [
    :game_creation,
    :game_duration,
    :game_end_timestamp,
    :game_id,
    :game_mode,
    :game_name,
    :game_start_timestamp,
    :game_type,
    :game_version,
    :map_id,
    :participants,
    :platform_id,
    :queue_id,
    :teams,
    :tournament_code,
  ]

  @type t :: %__MODULE__{
          game_creation: Integer.t(),
          game_duration: Integer.t(),
          game_end_timestamp: Integer.t(),
          game_id: Integer.t(),
          game_mode: String.t(),
          game_name: String.t(),
          game_start_timestamp: Integer.t(),
          game_type: String.t(),
          game_version: String.t(),
          map_id: Integer.t(),
          participants: [ParticipantDto.t()],
          platform_id: String.t(),
          queue_id: Integer.t(),
          teams: [TeamStatsDto.t()],
          tournament_code: String.t()
        }

  def from_map(%{} = info) do
    %__MODULE__{
      game_creation: Map.get(info, :game_creation, Map.get(info, "gameCreation")),
      game_duration: Map.get(info, :game_duration, Map.get(info, "gameDuration")),
      game_end_timestamp: Map.get(info, :game_end_timestamp, Map.get(info, "gameEndTimestamp")),
      game_id: Map.get(info, :game_id, Map.get(info, "gameId")),
      game_mode: Map.get(info, :game_mode, Map.get(info, "gameMode")),
      game_name: Map.get(info, :game_name, Map.get(info, "gameName")),
      game_start_timestamp: Map.get(info, :game_start_timestamp, Map.get(info, "gameStartTimestamp")),
      game_type: Map.get(info, :game_type, Map.get(info, "gameType")),
      game_version: Map.get(info, :game_version, Map.get(info, "gameVersion")),
      map_id: Map.get(info, :map_id, Map.get(info, "mapId")),
      participants: Map.get(info, :participants, Map.get(info, "participants", [])) |> Enum.map(&ParticipantDto.from_map/1),
      platform_id: Map.get(info, :platform_id, Map.get(info, "platformId")),
      queue_id: Map.get(info, :queue_id, Map.get(info, "queueId")),
      teams: Map.get(info, :teams, Map.get(info, "teams", [])) |> Enum.map(&TeamDto.from_map/1),
      tournament_code: Map.get(info, :tournament_code, Map.get(info, "tournamentCode"))
    }
  end

end

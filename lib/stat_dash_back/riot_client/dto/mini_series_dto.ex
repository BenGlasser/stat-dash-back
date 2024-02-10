defmodule StatDashBack.RiotClient.DTO.MiniSeriesDTO do
  defstruct [:wins, :losses, :target, :progress, :timeLeftToPlayMillis]

  @type t :: %__MODULE__{
          wins: Integer.t(),
          losses: Integer.t(),
          target: Integer.t(),
          progress: String.t(),
          timeLeftToPlayMillis: Integer.t()
        }

  def from_map(%{
        "wins" => wins,
        "losses" => losses,
        "target" => target,
        "progress" => progress,
        "timeLeftToPlayMillis" => timeLeftToPlayMillis
      }) do
    %__MODULE__{
      wins: wins,
      losses: losses,
      target: target,
      progress: progress,
      timeLeftToPlayMillis: timeLeftToPlayMillis
    }
  end
end

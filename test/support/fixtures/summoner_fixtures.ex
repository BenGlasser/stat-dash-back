defmodule StatDashBack.SummonerFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `StatDashBack.Summoner` context.
  """

  @doc """
  Generate a info.
  """
  def info_fixture(attrs \\ %{}) do
    {:ok, info} =
      attrs
      |> Enum.into(%{
        icon: "some icon",
        level: 42,
        mastery: 42,
        name: "some name",
        rank: 42
      })
      |> StatDashBack.Summoner.create_info()

    info
  end
end

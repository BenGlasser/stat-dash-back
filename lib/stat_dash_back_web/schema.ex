defmodule StatDashBackWeb.Schema do
  use Absinthe.Schema

  @desc "A Summoner in the game League of Legends."
  object :summoner do
    field :name, :string
    field :rank, :integer
    field :icon, :string
    field :level, :integer
    field :mastery, :integer
  end

  # Example data
  @data %{
    "summoner1" => %{
      id: 1,
      rank: 1,
      name: "Harry Potter",
      icon: "https://cataas.com/cat",
      level: 42,
      mastery: 1024
    },
    "summoner2" => %{
      id: 2,
      rank: 2,
      name: "Charlie Factory",
      icon: "https://cataas.com/cat",
      level: 42,
      mastery: 1024
    },
    "summoner3" => %{
      id: 3,
      rank: 3,
      name: "Sherlock Holmes",
      icon: "https://cataas.com/cat",
      level: 42,
      mastery: 1024
    }
  }

  query do
    field :summoner_info, :summoner do
      arg :id, non_null(:id)

      resolve fn %{id: summoner_id}, _ ->
        {:ok, @data[summoner_id]}
      end
    end
  end
end

defmodule StatDashBack.Summoner.Info do
  use Ecto.Schema
  import Ecto.Changeset

  @required [:name]
  @optional [:level, :rank, :icon, :mastery]

  schema "information" do
    field :name, :string
    field :level, :integer
    field :rank, :integer
    field :icon, :string
    field :mastery, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(info, attrs) do
    info
    |> cast(attrs, @required ++ @optional)
    |> validate_required(@required)
  end
end

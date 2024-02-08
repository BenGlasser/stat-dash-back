defmodule StatDashBack.Summoner.Info do
  use Ecto.Schema
  import Ecto.Changeset

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
    |> cast(attrs, [:name, :rank, :icon, :level, :mastery])
    |> validate_required([:name, :rank, :icon, :level, :mastery])
  end
end

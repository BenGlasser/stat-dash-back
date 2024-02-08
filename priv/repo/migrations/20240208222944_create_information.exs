defmodule StatDashBack.Repo.Migrations.CreateInformation do
  use Ecto.Migration

  def change do
    create table(:information) do
      add :name, :string
      add :rank, :integer
      add :icon, :string
      add :level, :integer
      add :mastery, :integer

      timestamps(type: :utc_datetime)
    end
  end
end

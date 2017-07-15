defmodule Succor.Repo.Migrations.CreateSuccor.Management.Team do
  use Ecto.Migration

  def change do
    create table(:management_teams) do
      add :name, :string, null: false

      timestamps()
    end

    create index(:management_teams, [:name], unique: true)
  end
end

defmodule Succor.Repo.Migrations.CreateSuccor.Management.Player do
  use Ecto.Migration

  def change do
    create table(:players) do
      add :name, :string
      add :email, :string

      timestamps()
    end

    create index(:players, [:email], unique: true)

    # Join table for many-to-many teams to players
    create table(:teams_players, primary_key: false) do
      add :team_id, references(:teams)
      add :player_id, references(:players)
    end
  end
end

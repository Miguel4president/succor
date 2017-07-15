defmodule Succor.Repo.Migrations.CreateSuccor.Management.Player do
  use Ecto.Migration

  def change do
    create table(:management_players) do
      add :name, :string
      add :email, :string
      add :team_id, references(:team, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:management_players, [:team_id])
  end
end

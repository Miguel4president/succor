defmodule Succor.Repo.Migrations.CreateSuccor.Management.Team do
  use Ecto.Migration

  def change do
    create table(:teams) do
      add :name, :string, null: false

      timestamps()
    end

    create index(:teams, [:name], unique: true)
  end
end

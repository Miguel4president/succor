defmodule Succor.Management.Team do
  use Ecto.Schema
  import Ecto.Changeset
  alias Succor.Management.Team


  schema "management_teams" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(%Team{} = team, attrs) do
    team
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end

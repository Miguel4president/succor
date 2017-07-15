defmodule Succor.Management.Player do
  use Ecto.Schema
  import Ecto.Changeset
  alias Succor.Management.Player


  schema "management_players" do
    field :email, :string
    field :name, :string
    field :team_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Player{} = player, attrs) do
    player
    |> cast(attrs, [:name, :email])
    |> validate_required([:name, :email])
  end
end

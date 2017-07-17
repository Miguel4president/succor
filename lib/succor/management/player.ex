defmodule Succor.Management.Player do
  use Ecto.Schema
  import Ecto.Changeset
  alias Ecto.Repo
  alias Succor.Management.Player


  schema "players" do
    field :email, :string
    field :name, :string
    many_to_many :teams, Succor.Management.Team, join_through: "teams_players"

    timestamps()
  end

  @doc false
  def changeset(%Player{} = player, attrs) do
    player
    |> cast(attrs, [:name, :email])
    |> validate_required([:name, :email])
    |> unique_constraint(:email)
  end

  # expects players to be a list of maps, one for each team
  # def prepare_players(attrs) do
  #   (attrs["tags"] || [])
  #   |> String.split(",")
  #   |> Enum.map(&String.trim/1)
  #   |> Enum.reject(& &1 == "")
  #   |> Enum.map(&get_or_insert_tag/1)
  #   # |> Repo.preload(:players)
  #   # |> put_assoc(:players, parse_players(attrs))
  # end
end

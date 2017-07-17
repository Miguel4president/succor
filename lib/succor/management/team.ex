defmodule Succor.Management.Team do
  use Ecto.Schema
  import Ecto.Changeset
  alias Succor.Management.Team


  schema "teams" do
    field :name, :string
    many_to_many :players, Succor.Management.Player, join_through: "teams_players"

    timestamps()
  end

  @doc false
  def changeset(%Team{} = team, attrs) do
    team
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end

# def parse_players(attrs) do
#   attrs["players"] || ""
  
# end

# defp parse_tags(params)  do
#     (params["tags"] || "")
#     |> String.split(",")
#     |> Enum.map(&String.trim/1)
#     |> Enum.reject(& &1 == "")
#     |> Enum.map(&get_or_insert_tag/1)
#   end

#   defp get_or_insert_tag(name) do
#     Repo.get_by(MyApp.Tag, name: name) ||
#       Repo.insert!(MyApp.Tag, %Tag{name: name})
#   end
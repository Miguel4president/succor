defmodule Succor.Web.TeamController do
  use Succor.Web, :controller

  alias Succor.Management
  alias Succor.Management.Team

  action_fallback Succor.Web.FallbackController

  def index(conn, _params) do
    teams = Management.list_teams()
    render(conn, "index.json", teams: teams)
  end

  def create(conn, %{"team" => team_params}) do
    with {:ok, %Team{} = team} <- Management.create_team(team_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", team_path(conn, :show, team))
      |> render("show.json", team: team)
    end
  end

  def show(conn, %{"id" => id}) do
    team = Management.get_team!(id)
    render(conn, "show.json", team: team)
  end

  def update(conn, %{"id" => id, "team" => team_params}) do
    team = Management.get_team!(id)

    with {:ok, %Team{} = team} <- Management.update_team(team, team_params) do
      render(conn, "show.json", team: team)
    end
  end

  def delete(conn, %{"id" => id}) do
    team = Management.get_team!(id)
    with {:ok, %Team{}} <- Management.delete_team(team) do
      send_resp(conn, :no_content, "")
    end
  end
end

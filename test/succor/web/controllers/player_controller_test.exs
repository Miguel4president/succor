defmodule Succor.Web.PlayerControllerTest do
  use Succor.Web.ConnCase

  alias Succor.Management
  alias Succor.Management.Player

  @create_attrs %{email: "some email", name: "some name"}
  @update_attrs %{email: "some updated email", name: "some updated name"}
  @invalid_attrs %{email: nil, name: nil}

  def fixture(:player) do
    {:ok, player} = Management.create_player(@create_attrs)
    player
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, player_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "creates player and renders player when data is valid", %{conn: conn} do
    conn = post conn, player_path(conn, :create), player: @create_attrs
    assert %{"id" => id} = json_response(conn, 201)["data"]

    conn = get conn, player_path(conn, :show, id)
    assert json_response(conn, 200)["data"] == %{
      "id" => id,
      "email" => "some email",
      "name" => "some name"}
  end

  test "does not create player and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, player_path(conn, :create), player: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates chosen player and renders player when data is valid", %{conn: conn} do
    %Player{id: id} = player = fixture(:player)
    conn = put conn, player_path(conn, :update, player), player: @update_attrs
    assert %{"id" => ^id} = json_response(conn, 200)["data"]

    conn = get conn, player_path(conn, :show, id)
    assert json_response(conn, 200)["data"] == %{
      "id" => id,
      "email" => "some updated email",
      "name" => "some updated name"}
  end

  test "does not update chosen player and renders errors when data is invalid", %{conn: conn} do
    player = fixture(:player)
    conn = put conn, player_path(conn, :update, player), player: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen player", %{conn: conn} do
    player = fixture(:player)
    conn = delete conn, player_path(conn, :delete, player)
    assert response(conn, 204)
    assert_error_sent 404, fn ->
      get conn, player_path(conn, :show, player)
    end
  end
end

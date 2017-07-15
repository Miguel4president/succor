defmodule Succor.Web.PageController do
  use Succor.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end

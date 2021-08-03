defmodule MediumWeb.PageController do
  use MediumWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end

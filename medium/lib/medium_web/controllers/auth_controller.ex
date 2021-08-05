defmodule MediumWeb.AuthController do
  use MediumWeb, :controller
  plug Ueberauth

  plug :put_layout, "landing.html"


  def callback(conn, _params) do
    IO.inspect(conn.assigns)
  end
end

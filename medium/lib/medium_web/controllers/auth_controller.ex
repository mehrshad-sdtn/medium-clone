defmodule MediumWeb.AuthController do
  use MediumWeb, :controller

  plug Ueberauth

  alias Medium.User
  alias Medium.Repo

  plug :put_layout, "landing.html"

  def callback(%{assigns: %{ueberauth_failure: _fails}} = conn, _params) do
    conn
    |> put_flash(:error, "Failed to authenticate.")
    |> redirect(to: Routes.page_path(@conn, :index))
  end

  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    #create the changeset params
    user_params = %{
      email: auth.info.email,
      first_name: auth.info.first_name,
      last_name: auth.info.last_name,
      provider: "google",
      token: auth.credentials.token
    }
    # 1) create empty user struct
    # 2) pass user struct and user_params to the changeset
    changeset = User.changeset(%User{}, user_params)
    signin(conn, changeset)

  end

  defp signin(conn, changeset) do
    #check if the user already exists or is signing up
    case insert_or_update(changeset) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Welcome")
        |> put_session(:user_id, user.id) #create a session with users id
        |> redirect(to: "/")


      {:error, _reason} ->
        conn
        |> put_flash(:error, "Error Signing In")
        |> redirect(to: "/")


    end
  end

  defp insert_or_update(changeset) do
    case Repo.get_by(User, email: changeset.changes.email) do
      #if the email in the changeset already exists
      nil -> signup(changeset)
      user -> {:ok, user}
    end
  end

  defp signup(changeset) do
    Repo.insert(changeset)
  end


end

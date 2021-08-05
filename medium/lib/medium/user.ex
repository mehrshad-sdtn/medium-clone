defmodule Medium.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :first_name, :string
    field :last_name, :string
    field :provider, :string
    field :token, :string
    timestamps()
  end


  @doc false
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :first_name, :last_name, :provider, :token])
    |> validate_required([:email, :first_name, :provider, :token])
  end


end

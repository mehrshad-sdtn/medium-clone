defmodule Medium.Repo.Migrations.AddUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :first_name, :string
      add :last_name, :string
      add :provider, :string
      add :token, :string

      timestamps()
    end


  end
end

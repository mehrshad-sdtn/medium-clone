defmodule Medium.Repo.Migrations.AddStories do
  use Ecto.Migration

  def change do
    create table(:stories) do
      add :title, :string
      add :preview, :string
      add :content, :string
      add :tag1, :string
      add :tag2, :string
      add :tag3, :string
      add :author_id, references(:users)
      timestamps()
    end
  end
end

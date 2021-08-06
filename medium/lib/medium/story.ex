defmodule Medium.Story do
  use Ecto.Schema
  import Ecto.Changeset

  schema "stories" do
    field :title, :string
    field :preview, :string
    field :content, :string
    field :tag1, :string
    field :tag2, :string
    field :tag3, :string
    belongs_to :user, Medium.User
    timestamps()
  end


  @doc false
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :preview, :content, :tag1, :tag2, :tag3])
    |> validate_required([:title, :preview, :content, :tag1])
  end


end

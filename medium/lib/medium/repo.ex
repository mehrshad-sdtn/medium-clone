defmodule Medium.Repo do
  use Ecto.Repo,
    otp_app: :medium,
    adapter: Ecto.Adapters.Postgres
end

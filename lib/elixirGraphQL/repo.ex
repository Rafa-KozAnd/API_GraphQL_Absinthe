defmodule APIGraphQL.Repo do
  use Ecto.Repo,
    otp_app: :APIGraphQL,
    adapter: Ecto.Adapters.Postgres
end

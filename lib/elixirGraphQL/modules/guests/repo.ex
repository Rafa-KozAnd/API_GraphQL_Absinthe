defmodule APIGraphQLWeb.Modules.Guests.GuestsRepo do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params [:name, :email]

  schema "guests" do
    field :email, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(guest, attrs) do
    guest
    |> cast(attrs, @required_params)
    |> validate_required(@required_params)
  end
end

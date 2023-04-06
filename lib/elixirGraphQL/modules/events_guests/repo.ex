defmodule APIGraphQLWeb.Modules.EventsGuests.EventGuestRepo do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  @required_params [:event_id, :guest_id]

  schema "events_guests" do
    field :event_id, :binary_id
    field :guest_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(events_guest, attrs) do
    IO.inspect(attrs)

    events_guest
    |> cast(attrs, @required_params)
    |> validate_required(@required_params)
  end
end

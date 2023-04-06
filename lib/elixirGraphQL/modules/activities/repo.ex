defmodule APIGraphQLWeb.Modules.Activities.ActivityRepo do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @required_params [:name, :date_event]

  schema "activities" do
    field :date_event, :date
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(activity, attrs) do
    %{date_event: date_event, name: name} = attrs

    [day, month, year] =
      date_event
      |> String.split("/")
      |> Enum.map(fn item ->
        String.to_integer(item)
      end)

    formated_attrs =
      attrs
      |> Map.put(:date_event, Date.new!(year, month, day))

    activity
    |> cast(formated_attrs, @required_params)
    |> validate_required(@required_params)
  end
end

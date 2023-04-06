defmodule APIGraphQLWeb.Graphql.Types do
  use Absinthe.Schema.Notation

  object :guests do
    field :id, :id
    field :name, :string
    field :email, :string
  end

  object :events do
    field :id, :id
    field :name, :string
    field :event_data, :string
  end

  object :event_guests do
    field :id, :id
    field :event_id, :string
    field :guest_id, :string
  end
end

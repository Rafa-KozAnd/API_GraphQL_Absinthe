defmodule APIGraphQLWeb.Graphql.Resolver do
  alias APIGraphQL.Modules.Guests.GuestsRepo
  alias APIGraphQL.Graphql.EventInfo

  def guests(_args, _info) do
    {:ok, EventInfo.get_guests()}
  end

  def create_guest(args, _info) do
    with {:ok, guest} <- EventInfo.create_guest(args) do
      {:ok, guest}
    else
      {:error, reason} -> {:error, "Fail to create a new guest"}
    end
  end

  def events(_args, _info) do
    {:ok, EventInfo.get_events()}
  end

  def create_event(args, _info) do
    with {:ok, event} <- EventInfo.create_event(args) do
      {:ok, event}
    else
      {:error, reason} -> {:error, "Fail to create a new event"}
      _ -> {:ok, "foi"}
    end
  end

  def get_event_guests(args, _info) do
    {:ok, EventInfo.get_event_guests(args)}
  end

  def create_event_guests(args, _info) do
    case EventInfo.create_event_guests(args) do
      {:ok, event_guests} ->
        {:ok, event_guests}

      _ ->
        {:error, "Error on create relation"}
    end
  end
end

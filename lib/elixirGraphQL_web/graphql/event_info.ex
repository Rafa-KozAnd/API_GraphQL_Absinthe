defmodule APIGraphQLWeb.Graphql.EventInfo do
  alias APIGraphQL.Modules.Guests.GuestsRepo
  alias APIGraphQL.Modules.Activities.ActivityRepo
  alias APIGraphQL.Modules.EventsGuests.EventGuestRepo
  alias APIGraphQL.Repo

  require Logger

  import Ecto.Query, only: [from: 2]

  def get_guests, do: Repo.all(GuestsRepo)

  def create_guest(args) do
    %GuestsRepo{}
    |> GuestsRepo.changeset(args)
    |> Repo.insert()
  end

  def get_events, do: Repo.all(ActivityRepo)

  def create_event(args) do
    %ActivityRepo{}
    |> ActivityRepo.changeset(args)
    |> Repo.insert()
  end

  def get_event_guests(args) do
    from(ev in EventGuestRepo,
      join: actvs in ActivityRepo,
      on: ev.event_id == actvs.id,
      join: guests in GuestsRepo,
      on: ev.guest_id == guests.id,
      # where: actvs.id == ^args,
      select: guests
    )
    |> Repo.all()
  end

  def create_event_guests(args) do
    %EventGuestRepo{}
    |> EventGuestRepo.changeset(args)
    |> Repo.insert()
  end
end

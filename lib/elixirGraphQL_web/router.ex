defmodule APIGraphQLWeb.Router do
  use APIGraphQLWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", APIGraphQLWeb do
    pipe_through :api
  end

  # forward "/graph" Absinthe.Plug, schema: APIGraphQLWeb.Graphql.Schema
  forward "/graph", Absinthe.Plug, schema: APIGraphQLWeb.Graphql.Schema
  forward "/graphiql", Absinthe.Plug.GraphiQL, schema: APIGraphQLWeb.Graphql.Schema

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: APIGraphQLWeb.Telemetry
    end
  end
end

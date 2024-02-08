defmodule StatDashBackWeb.Router do
  use StatDashBackWeb, :router

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/api", StatDashBackWeb do
    pipe_through(:api)
  end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:stat_dash_back, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through([:fetch_session, :protect_from_forgery])

      live_dashboard("/dashboard", metrics: StatDashBackWeb.Telemetry)
      forward("/mailbox", Plug.Swoosh.MailboxPreview)
    end

    scope "/api" do
      pipe_through(:api)
      forward("/", Absinthe.Plug, schema: StatDashBackWeb.Schema)
    end

    scope "/gql" do
      forward("/GraphiQL", Absinthe.Plug.GraphiQL, schema: StatDashBackWeb.Schema)
    end
  end
end

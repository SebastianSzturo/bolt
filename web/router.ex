defmodule Bolt.Router do
  use Phoenix.Router

  pipeline :proxy do
    plug CORSPlug
    plug :accepts, ~w(html)
  end

  scope "/", Bolt do
    pipe_through :proxy # Use the default browser stack

    get  "/", ProxyController, :get
    post "/", ProxyController, :post
  end
end

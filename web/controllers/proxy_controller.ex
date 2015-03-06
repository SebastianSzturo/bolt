defmodule Bolt.ProxyController do
  use Phoenix.Controller

  plug :action

  def get(conn, params) do
    url = params["url"]

    case url do
      :undefined ->
        html conn, ""

      url ->
        HTTPoison.start
        hackney = [follow_redirect: true]
        response = HTTPoison.get!(url, [], [ hackney: hackney ])

        html conn, response.body
    end
  end

  def post(conn, params) do
    url = params["url"]
    
    case url do
      :undefined ->
        html conn, ""

      url ->
        HTTPoison.start
        hackney = [follow_redirect: true]
        response = HTTPoison.post!(url, params, [ hackney: hackney ])

        html conn, response.body
    end
  end
end

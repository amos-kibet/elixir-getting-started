defmodule Genserver.Router do
  use Plug.Router

  get("/:name") do
    query_params = Plug.Conn.fetch_query_params(conn)
    name =  query_params.params["name"] || 1
    character = Genserver.ApiHandler.get_character(name)
    conn
      |> put_resp_content_type("application/json")
      |> send_resp(200, character)
  end
end

defmodule GeoTasks.Router do
  use Plug.Router

  if Mix.env == :dev do
    use Plug.Debugger
  end

  plug Plug.Logger
  plug :match
  plug :dispatch

  get "/api/tasks" do
    send_resp(conn, 200, "response")
    #    with {:ok, response} <- SearchIP.perform(conn.params["ip_address"]) do
#      send_resp(conn, 200, response)
#    else
#      nil ->
#        send_resp(conn, 402, "Please provide IP address")
#      {:error, reason} when is_binary(reason) ->
#        send_resp(conn, 402, "Error fetching geo data: #{reason}")
#      {:error, :not_found} ->
#        send_resp(conn, 404, "Network with given IP not found")
#      {:error, reason} ->
#        send_resp(conn, 500, "Unexpected error: #{inspect(reason)}")
#    end
  end

  match _ do
    send_resp(conn, 404, "oops")
  end
end
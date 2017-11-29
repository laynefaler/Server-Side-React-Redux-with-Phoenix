defmodule DAWeb.ReactController do
  use DAWeb, :controller

  def index(conn, _params) do
    initial_state = %{}
    react_stdio_args = %{
      component: Application.app_dir(:demo_app_ssjs, "priv/static/server/js/app.js"),
      props: %{
        "location" => conn.request_path,
        "initial_state" => initial_state
      }
    }
    {:ok, %{"html" => html}} = StdJsonIo.json_call(react_stdio_args)
    render(conn, "index.html", html: html, initial_state: initial_state)
  end
end

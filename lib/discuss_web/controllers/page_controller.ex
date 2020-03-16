defmodule DiscussWeb.PageController do
  use DiscussWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def leco(conn, _params) do
    json(conn, %{name: "leandro", alias: "leco"})
  end
end

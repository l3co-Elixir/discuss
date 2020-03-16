defmodule DiscussWeb.LanguageController do
  use DiscussWeb, :controller

  def java(conn, _params) do
    render(conn, "java.html")
  end
end

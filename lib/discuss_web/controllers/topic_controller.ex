defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller

  alias Discuss.Topic

  def new(conn, _params) do
    changeset = Topic.changeset(%Topic{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"topic" => topic} = params) do
    changeset = Topic.changeset(%Topic{}, topic)
    IO.puts "+++++++++++++"
    IO.inspect params
    IO.puts "+++++++++++++"
    IO.inspect changeset
    IO.puts "+++++++++++++"
    render(conn, "new.html")
  end
end

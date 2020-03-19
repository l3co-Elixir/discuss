defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller

  alias Discuss.Topic
  alias Discuss.TopicService

  def show_all(conn, params) do
    TopicService.show_all()
  end

  def new(conn, _params) do
    changeset = Topic.changeset(%Topic{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"topic" => topic}) do
    case TopicService.save(topic) do
      # {:ok, _} -> redirect(conn, to: "/topics")
      {:error, changeset} -> render(conn, "new.html", changeset: changeset)
    end
  end
end

defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller

  alias Discuss.Topic

  def index(conn, _params) do
    topics = Topic.get_all()
    render(conn, "index.html", topics: topics)
  end

  def new(conn, _params) do
    changeset = Topic.changeset(%Topic{}, %{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"topic" => topic}) do
    case Topic.save(topic) do
      {:ok, _} ->
        conn
        |> put_flash(:info, "Topic Created")
        |> redirect(to: Routes.topic_path(conn, :index))

      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def edit(conn, %{"id" => id}) do
    result = Topic.get_by_id(id)
    render(conn, "edit.html", topic: result.topic, changeset: result.changeset)
  end

  def update(conn, %{"id" => id, "topic" => topic}) do
    case Topic.update(id, topic) do
      {:ok, _} ->
        conn
        |> put_flash(:info, "Topic Update")
        |> redirect(to: Routes.topic_path(conn, :index))

      {:error, changeset, old_topic} ->
        render(conn, "edit.html", changeset: changeset, topic: old_topic)
    end
  end

  def delete(conn, %{"id" => id}) do
    Topic.delete(id)

    conn
    |> put_flash(:info, "Topic deleted")
    |> redirect(to: Routes.topic_path(conn, :index))
  end
end

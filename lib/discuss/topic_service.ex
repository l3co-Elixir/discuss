defmodule Discuss.TopicService do
  alias Discuss.Repo
  alias Discuss.Topic

  import Ecto.Query

  def save(topic) do
    Topic.changeset(%Topic{}, topic)
    |> Repo.insert()
  end

  def get_all() do
    Repo.all(Topic)
  end

  def get_by_id(id) do
    topic = Repo.get(Topic, id)
    %{topic: topic, changeset: Topic.changeset(topic)}
  end

  @spec update(any, :invalid | %{optional(:__struct__) => none, optional(atom | binary) => any}) ::
          any
  def update(id, topic) do
    old_topic = Repo.get(Topic, id)

    response =
      Topic.changeset(old_topic, topic)
      |> Repo.update()

    case response do
      {:ok, result} -> {:ok, result}
      {:error, changeset} -> {:error, changeset, old_topic}
    end
  end

  def delete(id) do
    topic = Repo.get(Topic, id)
    Repo.delete!(topic)
  end
end

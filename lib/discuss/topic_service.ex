defmodule Discuss.TopicService do
  alias Discuss.Repo
  alias Discuss.Topic

  def save(topic) do
    Topic.changeset(%Topic{}, topic)
    |> Repo.insert()
  end

  def show_all() do
    Repo.all(%Topic{})
  end
end

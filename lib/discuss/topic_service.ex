defmodule Discuss.TopicService do
  alias Discuss.Repo
  alias Discuss.Topic

  def save(topic) do
    Topic.changeset(%Topic{}, topic)
    |> Repo.insert()
  end

  def get_all() do
    Repo.all(Discuss.Topic)
  end
end

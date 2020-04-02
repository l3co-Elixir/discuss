defmodule Discuss.Topic do
  use Ecto.Schema

  import Ecto.Changeset

  alias Discuss.Repo
  alias Discuss.Topic

  schema "topics" do
    field :title, :string
    belongs_to :user, Discuss.User
    has_many :comments, Discuss.Comment
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title])
    |> validate_required([:title])
  end

  def save(topic, user) do
    user
    |> Ecto.build_assoc(:topics)
    |> Topic.changeset(topic)
    |> Repo.insert()
  end

  def get_all() do
    Repo.all(Topic)
  end

  def get_by_id(id) do
    topic = Repo.get(Topic, id)
    %{topic: topic, changeset: Topic.changeset(topic)}
  end

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
    Repo.get!(Topic, id)
    |> Repo.delete!()
  end
end

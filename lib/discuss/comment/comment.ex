defmodule Discuss.Comment do
  use Ecto.Schema

  import Ecto.Changeset


  @derive {Jason.Encoder, only: [:content]}

  schema "comments" do
    field :content, :string
    belongs_to :user, Discuss.User
    belongs_to :topic, Discuss.Topic
  end

  def changeset(struct, params) do
    struct
    |> cast(params, [:content])
    |> validate_required([:content])
  end

  def save(topic, content, user_id) do
    changeset =
      topic
      |> Ecto.build_assoc(:comments, user_id: user_id)
      |> Discuss.Comment.changeset(%{content: content})

    Discuss.Repo.insert(changeset)
    |> Discuss.Repo.preload(:user)
  end
end

defmodule Discuss.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Discuss.Repo
  alias Discuss.User

  schema "users" do
    field :email, :string
    field :provider, :string
    field :token, :string
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :provider, :token])
    |> validate_required([:email, :provider, :token])
  end

  def insert_or_update(changeset) do
    case Repo.get_by(User, email: changeset.changes.email) do
      nil -> Repo.insert(changeset)
      user -> {:ok, user}
    end
  end
end

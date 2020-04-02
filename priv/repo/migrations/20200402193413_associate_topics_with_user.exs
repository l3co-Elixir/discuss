defmodule Discuss.Repo.Migrations.AssociateTopicsWithUser do
  use Ecto.Migration

  def change do
    alter table(:topics) do
      add :user_id, references(:topics)
    end
  end
end

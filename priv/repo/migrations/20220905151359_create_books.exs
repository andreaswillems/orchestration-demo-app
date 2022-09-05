defmodule OnlineShop.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :author, :string
      add :title, :string
      add :year, :integer

      timestamps()
    end
  end
end

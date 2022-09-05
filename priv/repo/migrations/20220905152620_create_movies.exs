defmodule OnlineShop.Repo.Migrations.CreateMovies do
  use Ecto.Migration

  def change do
    create table(:movies, primary_key: false) do
      add :id, :uuid, primary_key: true
      add :title, :string
      add :year, :integer
      add :genre, :string

      timestamps()
    end
  end
end

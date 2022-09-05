defmodule OnlineShop.Products.Movie do
  use OnlineShop.Schema
  import Ecto.Changeset

  schema "movies" do
    field :genre, :string
    field :title, :string
    field :year, :integer

    timestamps()
  end

  @doc false
  def changeset(movie, attrs) do
    movie
    |> cast(attrs, [:title, :year, :genre])
    |> validate_required([:title, :year, :genre])
  end
end

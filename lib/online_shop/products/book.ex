defmodule OnlineShop.Products.Book do
  use OnlineShop.Schema
  import Ecto.Changeset

  schema "books" do
    field :author, :string
    field :title, :string
    field :year, :integer

    timestamps()
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:author, :title, :year])
    |> validate_required([:author, :title, :year])
  end
end

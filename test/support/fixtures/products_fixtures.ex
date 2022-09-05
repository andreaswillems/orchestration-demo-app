defmodule OnlineShop.ProductsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `OnlineShop.Products` context.
  """

  @doc """
  Generate a book.
  """
  def book_fixture(attrs \\ %{}) do
    {:ok, book} =
      attrs
      |> Enum.into(%{
        author: "some author",
        year: 42
      })
      |> OnlineShop.Products.create_book()

    book
  end

  @doc """
  Generate a movie.
  """
  def movie_fixture(attrs \\ %{}) do
    {:ok, movie} =
      attrs
      |> Enum.into(%{
        genre: "some genre",
        title: "some title",
        year: 42
      })
      |> OnlineShop.Products.create_movie()

    movie
  end
end

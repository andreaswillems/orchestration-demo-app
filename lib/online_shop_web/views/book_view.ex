defmodule OnlineShopWeb.BookView do
  use OnlineShopWeb, :view
  alias OnlineShopWeb.BookView

  def render("index.json", %{books: books}) do
    %{data: render_many(books, BookView, "book.json")}
  end

  def render("show.json", %{book: book}) do
    %{data: render_one(book, BookView, "book.json")}
  end

  def render("book.json", %{book: book}) do
    %{
      id: book.id,
      author: book.author,
      title: book.title,
      year: book.year
    }
  end
end
